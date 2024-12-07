#!C:/Strawberry/perl/bin/perl.exe
use strict;
use warnings;
use utf8;
use CGI;
use File::Path qw(make_path);

# Crear objeto CGI
my $cgi = CGI->new;

# Leer el parámetro enviado por POST
my $java_code = $cgi->param('java_code');

# Imprimir encabezado HTTP y generar el HTML dinámico
print $cgi->header(-type => 'text/html', -charset => 'UTF-8');

# Función para convertir código Java a PlantUML
sub java_to_puml {
    my ($code) = @_;
    my $uml = '@startuml' . "\n";

    # Extraer la clase principal
    if ($code =~ /public\s+class\s+(\w+)/) {
        my $class_name = $1;
        $uml .= "class $class_name {\n";
    } else {
        return { error => "No se pudo identificar la clase principal en el código Java." };
    }

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
    $uml .= '@enduml' . "\n";

    return { uml => $uml };
}

# Generar contenido UML
my $result = java_to_puml($java_code);

# Manejar errores en la conversión
if ($result->{error}) {
    print <<HTML;
    <div class="alert alert-danger">
        <p><strong>Error:</strong> $result->{error}</p>
    </div>
HTML
    exit;
}

# Guardar el archivo .puml
my $filename = "output_uml_" . time() . ".puml";
my $filepath = "E:/xampp/cgi-bin/prueba/$filename";

# Asegurar que el directorio exista
make_path('E:/xampp/cgi-bin/prueba') unless -d 'E:/xampp/cgi-bin/prueba';

if (open(my $fh, '>', $filepath)) {
    print $fh $result->{uml};
    close($fh);
    print <<HTML;
    <div class="alert alert-success">
        <p>¡Archivo UML generado exitosamente!</p>
        <p><strong>Contenido del archivo .puml:</strong></p>
        <pre>$result->{uml}</pre>
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