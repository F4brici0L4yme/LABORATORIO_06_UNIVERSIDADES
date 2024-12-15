#!/usr/bin/perl

use strict;
use warnings;
use CGI;
use File::Temp qw(tempfile);
use IPC::System::Simple qw(system);

# Crear objeto CGI
my $cgi = CGI->new;

# Leer parámetros enviados por POST
my $upload = $cgi->upload('puml_file');

# Verificar que el archivo .puml ha sido enviado
if (!$upload) {
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print "<p><strong>Error:</strong> No se recibió ningún archivo .puml.</p>";
    exit;
}

# Crear un archivo temporal para guardar el contenido del archivo subido
my ($temp_puml_fh, $temp_puml_file) = tempfile(SUFFIX => '.puml', DIR => '/var/www/uploads');
if (!$temp_puml_fh) {
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print "<p><strong>Error:</strong> No se pudo crear un archivo temporal para almacenar el archivo subido.</p>";
    exit;
}

# Leer el contenido del archivo subido y guardarlo en el archivo temporal
while (my $line = <$upload>) {
    print $temp_puml_fh $line;
}
close $temp_puml_fh;

# Crear un archivo temporal para la imagen en formato SVG
my ($temp_svg_fh, $temp_svg_file) = tempfile(SUFFIX => '.svg', DIR => '/var/www/uploads');
close $temp_svg_fh;

# Ejecutar PlantUML para generar la imagen SVG
my $plantuml_command = "java -jar /usr/local/bin/plantuml.jar -tsvg $temp_puml_file -o /var/www/uploads";
eval {
    system($plantuml_command);
    1;
} or do {
    my $error = $@ || 'Error desconocido';
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print "<p><strong>Error:</strong> No se pudo generar el diagrama UML. Detalles: $error</p>";
    unlink $temp_puml_file;
    exit;
};

# Analizar el contenido del archivo .puml para extraer clases, interfaces y relaciones
open my $puml_fh, '<', $temp_puml_file or do {
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print "<p><strong>Error:</strong> No se pudo leer el archivo .puml para procesarlo.</p>";
    unlink $temp_puml_file;
    unlink $temp_svg_file;
    exit;
};

close $puml_fh;

# Verificar si el archivo SVG fue generado correctamente
my $svg_file = $temp_puml_file;
$svg_file =~ s/\.puml$/.svg/;
if (-e $svg_file) {
    # Mover el archivo SVG a la carpeta de uploads
    my $saved_svg = "/var/www/uploads/generated_diagram.svg";
    rename $svg_file, $saved_svg;

    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print <<HTML;
    <div>
        <p>¡Archivo subido y procesado exitosamente!</p>
        <p>Descarga tu <a href="/uploads/generated_diagram.svg">diagrama SVG</a></p>
    </div>
HTML
} else {
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print "<p><strong>Error:</strong> No se encontró la imagen SVG generada.</p>";
    unlink $temp_puml_file;
    exit;
}
