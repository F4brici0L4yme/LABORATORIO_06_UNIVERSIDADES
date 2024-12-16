#!/usr/bin/perl
use strict;
use warnings;
use JSON;

# Ruta relativa del archivo .puml
my $puml_file = '../puml_files/archivo.puml';

# Ruta del ejecutable de PlantUML (ajusta esta ruta según tu configuración)
my $javapuml_path = '../puml_files/plantuml.jar';

# Ruta de salida para el mensaje HTML
my $output_html = '../var/www/html/general.html';

# Verifica si el archivo .puml existe
unless (-e $puml_file) {
    escribir_html($output_html, { mensaje => "El archivo no se pudo generar." });
    die "El archivo $puml_file no existe.\n";
}

# Comando para generar la imagen SVG usando PlantUML
my $output_file = '../puml_files/diagrama.svg';
my $plantuml_command = "java -jar $javapuml_path -tsvg $puml_file -o ../puml_files";

# Ejecuta el comando
if (system($plantuml_command) == 0 && -e $output_file) {
    escribir_html($output_html, { mensaje => "Archivo generado exitosamente." });
    print "Imagen SVG generada exitosamente: $output_file\n";
} else {
    escribir_html($output_html, { mensaje => "El archivo no se pudo generar." });
    die "Error al ejecutar PlantUML o generar el archivo SVG.\n";
}

# Función para escribir el mensaje en formato JSON dentro del archivo HTML
sub escribir_html {
    my ($ruta, $data) = @_;
    open my $fh, '>', $ruta or die "No se pudo abrir el archivo $ruta: $!\n";
    print $fh to_json($data, { pretty => 1 });
    close $fh;
}