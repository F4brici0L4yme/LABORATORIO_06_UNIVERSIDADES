#!C:/Strawberry/perl/bin/perl.exe
use strict;
use warnings;
use utf8;
use CGI;
use File::Path qw(make_path);

# Crear objeto CGI
my $cgi = CGI->new;

# Leer los parámetros enviados por POST
my $java_code_main = $cgi->param('java_code_main');
my $java_code_inheritance = $cgi->param('java_code_inheritance');
my $java_code_interface = $cgi->param('java_code_interface');
my $java_code_class = $cgi->param('java_code_class');

# Imprimir encabezado HTTP y generar el HTML dinámico
print $cgi->header(-type => 'text/html', -charset => 'UTF-8');

# Función para convertir código Java a PlantUML
sub java_to_puml {
    my ($code, $class_name) = @_;
    my $uml = '';

    # Si se proporciona un nombre de clase, se añade al archivo UML
    $uml .= "class $class_name {\n" if $class_name;

    # Extraer métodos (ignorando comentarios y JavaDoc)
    while ($code =~ /public\s+(\w+)\s+(\w+)\s*\((.*?)\)/g) {
        my $return_type = $1;
        my $method_name = $2;
        my $params = $3 || "";

        # Eliminar comentarios y normalizar espacios
        $params =~ s/\s*\/\/.*//g;   # Eliminar comentarios en línea
        $params =~ s/\s*\/\*.*?\*\/\s*//g; # Eliminar comentarios en bloque
        $params =~ s/\s+/ /g;       # Normalizar espacios

        $uml .= "  + $method_name($params) : $return_type\n";
    }

    # Cerrar definición de la clase
    $uml .= "}\n";
    return $uml;
}

# Generar el contenido UML para cada caja de texto (Main, Herencia, Interface, Clase)
my $uml_content = '@startuml' . "\n";

# Procesar cada sección de código
$uml_content .= java_to_puml($java_code_main, 'Main') if $java_code_main;
$uml_content .= java_to_puml($java_code_inheritance, 'Herencia') if $java_code_inheritance;
$uml_content .= java_to_puml($java_code_interface, 'Interface') if $java_code_interface;
$uml_content .= java_to_puml($java_code_class, 'Clase') if $java_code_class;

$uml_content .= '@enduml' . "\n";

# Ruta para guardar el archivo .puml
my $filename = "output_uml.puml";
my $filepath = "E:/xampp/cgi-bin/prueba/$filename";

# Asegurar que el directorio exista
make_path('E:/xampp/cgi-bin/prueba') unless -d 'E:/xampp/cgi-bin/prueba';

# Guardar el archivo .puml
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
        <p><strong>Error:</strong> No se pudo crear el archivo UML.</p>
    </div>
HTML
    exit;
}
