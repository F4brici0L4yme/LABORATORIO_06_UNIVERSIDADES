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
        # Guardar archivo temporalmente
        my ($fh, $tempfile) = tempfile(SUFFIX => '.java');
        while (<$uploaded_file>) {
            print $fh $_;
        }
        close $fh;

        # Ejecutar el generador UML
        my $output = generate_uml($tempfile);
        print $output || "Error al generar UML.";
    } else {
        print "Error: No se recibió un archivo.";
    }
} elsif ($path eq '/text') {
    my $java_text = $cgi->param('javaText');
    if ($java_text) {
        # Crear archivo temporal con el contenido recibido
        my ($fh, $tempfile) = tempfile(SUFFIX => '.java');
        print $fh $java_text;
        close $fh;

        # Ejecutar el generador UML
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

    my ($class_name, @attributes, @methods, $class_doc);
    my $current_method_doc = '';
    
    foreach my $line (@lines) {
        # Detectar clases
        if ($line =~ /^\s*public\s+class\s+(\w+)/) {
            $class_name = $1;
        }
        
        # Detectar comentarios Javadoc (antes de la clase o el método)
        if ($line =~ /^\s*\/\*\*.*\*\//) {
            # Extraer el comentario Javadoc completo
            my $javadoc_comment = $line;
            while ($line !~ /^\s*\*\// && defined($line = shift @lines)) {
                $javadoc_comment .= $line;
            }
            # Asignar el comentario Javadoc a la clase o método
            if ($line =~ /^\s*public\s+class\s+(\w+)/) {
                $class_doc = $javadoc_comment;
            } elsif ($line =~ /^\s*public\s+(\w+)\s+(\w+)\(.*\)/) {
                $current_method_doc = $javadoc_comment;
            }
        }

        # Detectar atributos (pueden ser públicos o privados)
        elsif ($line =~ /^\s*(public|private|protected)?\s*(\w+)\s+(\w+);/) {
            my $visibility = $1 || '';  # Puede ser public, private, protected o vacío
            my $type = $2;              # Tipo del atributo
            my $name = $3;              # Nombre del atributo
            if ($visibility eq "public") {
                push @attributes, "+ $name : $type";
            } else {
                push @attributes, "- $name : $type";
            }
        }
        
        # Detectar métodos
        elsif ($line =~ /^\s*(public|private|protected)?\s*(\w+)\s+(\w+)\(.*\)/) {
            my $visibility = $1 || '';  # Puede ser public, private, protected o vacío
            my $return_type = $2;       # Tipo de retorno
            my $method_name = $3;       # Nombre del método
            if ($visibility eq "public") {
                push @methods, "+ $method_name() : $return_type";
            } else {
                push @methods, "- $method_name() : $return_type";
            }
            # Asignar el comentario Javadoc al método si existe
            if ($current_method_doc) {
                push @methods, "// Javadoc: $current_method_doc";
                $current_method_doc = '';  # Resetear comentario después de usarlo
            }
        }
    }

    return "No se encontró ninguna clase en el archivo." unless $class_name;

    # Crear UML en texto
    my $uml = '@startuml\n';
    $uml .= "class $class_name {\n";
    
    # Agregar Javadoc de la clase si existe
    if ($class_doc) {
        $uml .= "// Javadoc: $class_doc\n";
    }
    
    # Agregar atributos
    if (@attributes) {
        $uml .= join("\n", @attributes) . "\n";
    }
    
    # Línea de separación entre atributos y métodos
    $uml .= " --\n" if @attributes && @methods;
    
    # Agregar métodos
    if (@methods) {
        $uml .= join("\n", @methods) . "\n";
    }

    $uml .= "}\n";
    $uml .= '@enduml\n';

    return $uml;
}
