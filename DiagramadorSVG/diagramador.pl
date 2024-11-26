#!/usr/bin/perl -w
use strict;
use warnings;

my $file_name = './diagram.puml';  # Ruta del archivo .puml
my $plantuml_jar = './plantuml.jar';        # Ruta al archivo plantuml.jar

# Verificar que el archivo PUML existe
die "error" unless -e $file_name;

# Generar el nombre del archivo SVG
(my $svg_file = $file_name) =~ s/\.puml$/.svg/;

# Construir el comando para generar el archivo SVG
my $command_svg = qq(java -Xmx1024m -jar "$plantuml_jar" -tsvg "$file_name");

# Ejecutar el comando
system($command_svg) == 0 or die "Error al generar el archivo SVG: $!";
