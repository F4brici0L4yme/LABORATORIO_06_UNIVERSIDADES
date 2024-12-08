#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use File::Temp qw(tempfile);

# Crear un objeto CGI
my $cgi = CGI->new;

# Obtener la ruta solicitada
my $path = $cgi->path_info;

# Establecer la cabecera HTTP
print $cgi->header("text/plain");

if ($path eq '/upload') {
    my $uploaded_file = $cgi->upload('javaFile');
    if ($uploaded_file) {
        my ($fh, $tempfile) = tempfile(SUFFIX => '.java');
        while (<$uploaded_file>) {
            print $fh $_;
        }
        close $fh;

        my $output = generate_uml($tempfile);
        print $output || "Error al generar UML.";
    } else {
        print "Error: No se recibió un archivo.";
    }
} elsif ($path eq '/text') {
    my $java_text = $cgi->param('javaText');
    if ($java_text) {
        my ($fh, $tempfile) = tempfile(SUFFIX => '.java');
        print $fh $java_text;
        close $fh;

        my $output = generate_uml($tempfile);
        print $output || "Error al generar UML.";
    } else {
        print "Error: No se recibió texto.";
    }
} else {
    print "Ruta no encontrada.";
}

# Función para generar UML
sub generate_uml {
    my ($input_file) = @_;

    open(my $fh, '<', $input_file) or return "No se pudo abrir el archivo.";
    my @lines = <$fh>;
    close($fh);

    my %uml_entities;
    my @relationships;
    my $current_entity;
    my %class_attributes;

    foreach my $line (@lines) {
        chomp($line);

        # Detectar clases (abiertas o no)
        if ($line =~ /^\s*public\s+(abstract\s+)?class\s+(\w+)/) {
            $current_entity = $2;
            $uml_entities{$current_entity} = {
                type => 'class',
                name => $2,
                abstract => $1 ? 1 : 0,
                attributes => [],
                methods => []
            };
        }
        # Detectar interfaces
        elsif ($line =~ /^\s*public\s+interface\s+(\w+)/) {
            $current_entity = $1;
            $uml_entities{$current_entity} = {
                type => 'interface',
                name => $1,
                attributes => [],
                methods => []
            };
        }
        # Detectar herencia de clases (extends)
        elsif ($line =~ /^\s*public\s+class\s+(\w+)\s+extends\s+(\w+)/) {
            my ($subclass, $superclass) = ($1, $2);
            push @relationships, "$subclass --|> $superclass : hereda";
        }
        # Detectar implementación de interfaces (implements)
        elsif ($line =~ /^\s*public\s+class\s+(\w+)\s+implements\s+([\w, ]+)/) {
            my $class = $1;
            my @interfaces = split /,/, $2;
            foreach my $interface (@interfaces) {
                $interface =~ s/^\s+|\s+$//g;  # Limpiar espacios
                push @relationships, "$class ..|> $interface : implementa";
            }
        }
        # Detectar atributos (composición/agregación)
        elsif ($line =~ /^\s*(public|private|protected)?\s*(\w+)\s+(\w+);/) {
            if ($current_entity) {
                my $visibility = $1 || 'default';
                my $type = $2;
                my $name = $3;
                push @{$uml_entities{$current_entity}{attributes}}, {
                    visibility => $visibility,
                    type => $type,
                    name => $name
                };

                # Almacenar el atributo con el tipo de clase para relaciones futuras
                if ($type !~ /int|String|boolean|double|float|char|long|short|byte|boolean/) {
                    push @{$class_attributes{$current_entity}}, $type;  # Almacena las clases asociadas
                }
            }
        }
        # Detectar métodos
        elsif ($line =~ /^\s*(public|private|protected)?\s*(\w+)\s+(\w+)\(.*\)/) {
            if ($current_entity) {
                my $visibility = $1 || 'default';
                my $return_type = $2;
                my $method_name = $3;
                push @{$uml_entities{$current_entity}{methods}}, {
                    visibility => $visibility,
                    return_type => $return_type,
                    name => $method_name
                };
            }
        }
    }

    # Generar UML en texto
    my $uml = '@startuml' . "\n";

    # Agregar clases, interfaces, atributos y métodos al diagrama UML
    foreach my $entity_name (keys %uml_entities) {
        my $entity = $uml_entities{$entity_name};
        if ($entity->{type} eq 'interface') {
            $uml .= "interface $entity->{name} {\n";
        } elsif ($entity->{abstract}) {
            $uml .= "abstract class $entity->{name} {\n";
        } else {
            $uml .= "class $entity->{name} {\n";
        }

        # Agregar atributos
        foreach my $attr (@{$entity->{attributes}}) {
            my $visibility = $attr->{visibility} eq 'public' ? '+' : '-';
            $uml .= "    $visibility $attr->{name} : $attr->{type}\n";
        }

        # Línea de separación entre atributos y métodos
        $uml .= "    --\n" if @{$entity->{attributes}} && @{$entity->{methods}};

        # Agregar métodos
        foreach my $method (@{$entity->{methods}}) {
            my $visibility = $method->{visibility} eq 'public' ? '+' : '-';
            $uml .= "    $visibility $method->{name}() : $method->{return_type}\n";
        }

        $uml .= "}\n";
    }

    # Agregar relaciones de composición/agregación basadas en los atributos
    foreach my $class (keys %class_attributes) {
        foreach my $related_class (@{$class_attributes{$class}}) {
            push @relationships, "$class \"1\" *-- \"1\" $related_class : tiene";
        }
    }

    # Agregar todas las relaciones (herencia, implementación, composición, etc.)
    if (@relationships) {
        $uml .= join("\n", @relationships) . "\n";
    }

    $uml .= '@enduml' . "\n";
    return $uml;
}