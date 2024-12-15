#!C:/Strawberry/perl/bin/perl.exe

use strict;
use warnings;
use utf8;
use CGI;
use File::Temp qw(tempfile);
use File::Path qw(make_path);

# Crear objeto CGI
my $cgi = CGI->new;

# Leer parámetros enviados por POST

my $java_code_main        = $cgi->param('java_code_main');
my $java_code_inheritance = $cgi->param('java_code_inheritance');
my $java_code_interface   = $cgi->param('java_code_interface');
my $java_code_class       = $cgi->param('java_code_class');

# Imprimir encabezado HTTP y generar el HTML dinámico
print $cgi->header(-type => 'text/html', -charset => 'UTF-8');

print"$java_code_class";
# Función para procesar el código Java y generar el contenido UML
sub generate_uml {
    my ($java_code) = @_;

    # Manejar errores si no hay código proporcionado
    return "" unless $java_code;

    my %uml_entities;
    my @relationships;
    my $current_entity;
    my %class_attributes;

    foreach my $line (split /\n/, $java_code) {
        chomp($line);

        # Detectar clases
        if ($line =~ /^\s*public\s+(abstract\s+)?class\s+(\w+)/) {
            $current_entity = $2;
            $uml_entities{$current_entity} = {
                type       => 'class',
                name       => $2,
                abstract   => $1 ? 1 : 0,
                attributes => [],
                methods    => []
            };
        }
        # Detectar interfaces
        elsif ($line =~ /^\s*public\s+interface\s+(\w+)/) {
            $current_entity = $1;
            $uml_entities{$current_entity} = {
                type       => 'interface',
                name       => $1,
                attributes => [],
                methods    => []
            };
        }
        # Detectar herencia de clases
        elsif ($line =~ /^\s*public\s+class\s+(\w+)\s+extends\s+(\w+)/) {
            push @relationships, "$1 --|> $2 : hereda";
        }
        # Detectar implementación de interfaces
        elsif ($line =~ /^\s*public\s+class\s+(\w+)\s+implements\s+([\w, ]+)/) {
            my $class      = $1;
            my @interfaces = split /,/, $2;
            foreach my $interface (@interfaces) {
                $interface =~ s/^\s+|\s+$//g;
                push @relationships, "$class ..|> $interface : implementa";
            }
        }
        # Detectar atributos
        elsif ($line =~ /^\s*(public|private|protected)?\s*(\w+)\s+(\w+);/) {
            if ($current_entity) {
                my $visibility = $1 || 'default';
                my $type       = $2;
                my $name       = $3;
                push @{$uml_entities{$current_entity}{attributes}}, {
                    visibility => $visibility,
                    type       => $type,
                    name       => $name
                };

                # Relación de composición
                if ($type !~ /int|String|boolean|double|float|char|long|short|byte/) {
                    push @{$class_attributes{$current_entity}}, $type;
                }
            }
        }
        # Detectar métodos
        elsif ($line =~ /^\s*(public|private|protected)?\s*(\w+)\s+(\w+)\(.*\)/) {
            if ($current_entity) {
                my $visibility  = $1 || 'default';
                my $return_type = $2;
                my $method_name = $3;
                push @{$uml_entities{$current_entity}{methods}}, {
                    visibility  => $visibility,
                    return_type => $return_type,
                    name        => $method_name
                };
            }
        }
    }

    # Generar texto UML
    my $uml = "";

    foreach my $entity_name (keys %uml_entities) {
        my $entity = $uml_entities{$entity_name};

        if ($entity->{type} eq 'interface') {
            $uml .= "interface $entity->{name} {\n";
        } elsif ($entity->{abstract}) {
            $uml .= "abstract class $entity->{name} {\n";
        } else {
            $uml .= "class $entity->{name} {\n";
        }

        foreach my $attr (@{$entity->{attributes}}) {
            my $visibility = $attr->{visibility} eq 'public' ? '+' : '-';
            $uml .= "    $visibility $attr->{name} : $attr->{type}\n";
        }

        $uml .= "    --\n" if @{$entity->{attributes}} && @{$entity->{methods}};

        foreach my $method (@{$entity->{methods}}) {
            my $visibility = $method->{visibility} eq 'public' ? '+' : '-';
            $uml .= "    $visibility $method->{name}() : $method->{return_type}\n";
        }

        $uml .= "}\n";
    }

    foreach my $class (keys %class_attributes) {
        foreach my $related_class (@{$class_attributes{$class}}) {
            push @relationships, "$class \"1\" *-- \"1\" $related_class : tiene";
        }
    }

    $uml .= join("\n", @relationships) . "\n" if @relationships;

    return $uml;
}

# Generar UML dinámico
my $uml_content = '@startuml'."\n";
$uml_content .= generate_uml($java_code_main);
$uml_content .= generate_uml($java_code_inheritance);
$uml_content .= generate_uml($java_code_interface);
$uml_content .= generate_uml($java_code_class);
$uml_content .= '@enduml'."\n";

# Ruta para guardar el archivo .puml
my $output_dir = "E:/xampp/cgi-bin/prueba";
my $filename   = "output_uml.puml";
my $filepath   = "$output_dir/$filename";

# Asegurar que el directorio exista
make_path($output_dir) unless -d $output_dir;

# Guardar el archivo UML
if (open(my $fh, '>', $filepath)) {
    print $fh $uml_content;
    close($fh);
    print <<HTML;
    <div class="alert alert-success">
        <p>Archivo UML generado exitosamente</p>
        <p><strong>Contenido del archivo .puml:</strong></p>
        <pre>$uml_content</pre>
        <p><a href="/prueba/$filename" download class="btn btn-success">Descargar UML</a></p>
    </div>
HTML
} else {
    print <<HTML;
    <div class="alert alert-danger">
        <p><strong>Error:</strong> No se pudo crear el archivo UML. Verifique los permisos del directorio.</p>
    </div>
HTML
    exit;
}
