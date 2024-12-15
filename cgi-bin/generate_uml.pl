#!/usr/bin/perl

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

sub generate_uml_class {
    my ($java_code) = @_;

    my @lines = split /\n/, $java_code;  # Divide el código Java en líneas
    my @uml_contents;                   # Almacena las partes extraídas para el UML
    my $current_class = '';             # Para rastrear la clase actual

    foreach my $line (@lines) {
        # Ignorar líneas que son comentarios o espacios antes de comentarios
        next if $line =~ /^\s*(\/\*|\*|\/\/)/;

        # Buscar declaraciones de clases
        if ($line =~ /^\s*public\s+(abstract\s+)?class\s+(\w+)/) {
            $current_class = $2;  # Captura el nombre de la clase
            push @uml_contents, "class $current_class {";
        }

        # Buscar atributos
        elsif ($line =~ /^\s*(public|private|protected)\s+(.*?);/) {
            my $visibility = $1;  # Captura public, private o protected
            my $content = $2;     # Captura el contenido después de la visibilidad

            # Determinar el prefijo según la visibilidad
            my $prefix = $visibility eq 'public'    ? '+' :
                         $visibility eq 'private'   ? '-' :
                         $visibility eq 'protected' ? '#' : '';

            # Verificar si tiene la palabra static
            my $is_static = '';
            if ($content =~ /\bstatic\s+/) {
                $is_static = '{static} ';
                $content =~ s/\bstatic\s+//g;  # Elimina la palabra static del contenido
            }

            # Ignorar la palabra final si está presente
            $content =~ s/\bfinal\s+//g;

            # Capturar tipo de dato, nombre y valor
            if ($content =~ /^(\w+)\s+(\w+)(?:\s*=\s*(.+))?$/) {
                my $type = $1;         # Captura el tipo de dato
                my $name = $2;         # Captura el nombre del atributo
                my $value = $3 // '';  # Captura el valor si existe (o vacío)

                # Si hay un valor, eliminar comillas si existen
                $value =~ s/^["']//g;
                $value =~ s/["']$//g;

                # Construir la representación UML del atributo
                my $uml_line = "\t$prefix$is_static$name: $type";
                $uml_line .= " = $value" if $value;  # Agregar el valor si existe

                push @uml_contents, $uml_line;
            }
        }

        # Buscar métodos
        elsif ($line =~ /^\s*(public|private|protected)\s+(.*?\{)/) {
            my $visibility = $1;  # Captura public, private o protected
            my $content = $2;     # Captura el contenido después de la visibilidad

            # Determinar el prefijo según la visibilidad
            my $prefix = $visibility eq 'public'    ? '+' :
                         $visibility eq 'private'   ? '-' :
                         $visibility eq 'protected' ? '#' : '';

            # Verificar si tiene la palabra static
            my $is_static = '';
            if ($content =~ /\bstatic\s+/) {
                $is_static = '{static} ';
                $content =~ s/\bstatic\s+//g;  # Elimina la palabra static del contenido
            }

            # Eliminar la palabra abstract si está presente
            $content =~ s/\babstract\s+//g;

            # Capturar tipo de retorno, nombre del método, y parámetros
            if ($content =~ /^(\w+)\s+(\w+)\((.*?)\)\s*\{/) {
                my $return_type = $1;          # Captura el tipo de retorno
                my $method_name = $2;          # Captura el nombre del método
                my $parameters = $3;           # Captura los parámetros

                # Construir la representación UML del método
                push @uml_contents, "\t$prefix$is_static$method_name($parameters) : $return_type";
            }
        }
    }

    # Cerrar la clase si fue abierta
    push @uml_contents, "}" if $current_class;

    # Combinar los contenidos extraídos en un bloque de UML
    my $uml = join("\n", @uml_contents);
    return $uml;
}

sub generate_uml_interface {
    my ($java_code) = @_;

    my @lines = split /\n/, $java_code;  # Dividir el código Java en líneas
    my @uml_contents;                    # Almacena las partes extraídas para el UML
    my $inside_interface = 0;            # Bandera para saber si estamos dentro de una interfaz

    foreach my $line (@lines) {
        # Ignorar líneas vacías y comentarios
        next if $line =~ /^\s*$/ || $line =~ /^\s*(\/\*|\*|\/\/)/;

        # Capturar la declaración de la interfaz
        if ($line =~ /^\s*(?:public\s+)?interface\s+(\w+)/) {
            my $interface_name = $1;
            push @uml_contents, "interface $interface_name {";
            $inside_interface = 1;  # Marcar que estamos dentro de una interfaz
            next;
        }

        # Procesar atributos (siempre son static y tienen valor asignado)
        if ($inside_interface && $line =~ /^\s*(\w+)\s+(\w+)\s*=\s*([^;]+);/) {
            my $type = $1;            # Tipo del atributo
            my $name = $2;            # Nombre del atributo
            my $value = $3;           # Valor del atributo
            $value =~ s/['"]//g;      # Eliminar comillas si las tiene

            # Agregar atributo al UML (siempre static)
            push @uml_contents, "\t+{static} $name: $type = $value";
            next;
        }

        # Procesar métodos con su nombre, parámetros y tipo de retorno
        if ($inside_interface && $line =~ /^\s*(\w+)\s+(\w+)\((.*?)\)\s*;\s*$/) {
            my ($return_type, $method_name, $params) = ($1, $2, $3);

            # Agregar método al UML
            push @uml_contents, "\t+$method_name($params): $return_type;";
            next;
        }

        # Detectar el cierre de una interfaz
        if ($line =~ /^\s*}/ && $inside_interface) {
            push @uml_contents, "}\n";
            $inside_interface = 0;  # Marcar que hemos salido de la interfaz
            next;
        }
    }

    # Combinar y devolver el UML
    return join("\n", @uml_contents);
}

# Generar UML dinámico
my $uml_content = '@startuml'."\n";
$uml_content .= generate_uml_class($java_code_inheritance) ."\n";
$uml_content .= generate_uml_interface($java_code_interface) ."\n";
$uml_content .= generate_uml_class($java_code_class) ."\n\n";
$uml_content .= generate_uml_class($java_code_main) ."\n";
$uml_content .= "\n".'@enduml'."\n";

# Ruta para guardar el archivo .puml
my $output_dir = "/usr/lib/puml_files/";
my $filename   = "archivo.puml";
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
        <p><a type="submit" href="./save_puml.pl">Guardar</a></p>
        <p><a type="submit" href="./fetch_puml_history.pl">Ver historial</a></p>
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