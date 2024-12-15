#!/usr/bin/perl

use strict;
use warnings;
use CGI;
use File::Temp qw(tempfile);
use IPC::System::Simple qw(system);
use DBI;

# Configuración de la base de datos
my $dsn = "DBI:mysql:database=puml_history;host=localhost";
my $db_user = "root";
my $db_password = "";

# Crear objeto CGI
my $cgi = CGI->new;

# Conexión a la base de datos
my $dbh = DBI->connect($dsn, $db_user, $db_password, { RaiseError => 1, AutoCommit => 1 })
    or do {
        print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
        print "<p><strong>Error:</strong> No se pudo conectar a la base de datos.</p>";
        exit;
    };

# Ruta fija para el archivo SVG generado
my $output_dir = "../puml_files"; # Ajustar según la estructura del servidor
my $svg_file = "$output_dir/diagrama.svg";

# Obtener el último user_id de la tabla files
my $sth_user = $dbh->prepare("SELECT user_id FROM files ORDER BY id DESC LIMIT 1");
$sth_user->execute();
my ($last_user_id) = $sth_user->fetchrow_array;
$sth_user->finish;

if (!$last_user_id) {
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print "<p><strong>Error:</strong> No se encontró ningún user_id en la tabla files.</p>";
    $dbh->disconnect;
    exit;
}

# Obtener el último archivo .puml del último user_id
my $sth_file = $dbh->prepare("SELECT content, id FROM files WHERE user_id = ? ORDER BY id DESC LIMIT 1");
$sth_file->execute($last_user_id);
my $row = $sth_file->fetchrow_hashref;
$sth_file->finish;

if (!$row) {
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print "<p><strong>Error:</strong> No se encontró ningún archivo .puml para el último user_id.</p>";
    $dbh->disconnect;
    exit;
}

my $puml_content = $row->{content};

# Crear un archivo temporal para guardar el contenido del archivo .puml
my ($temp_puml_fh, $temp_puml_file) = tempfile(SUFFIX => '.puml', DIR => $output_dir);
if (!$temp_puml_fh) {
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print "<p><strong>Error:</strong> No se pudo crear un archivo temporal para almacenar el contenido del archivo .puml.</p>";
    $dbh->disconnect;
    exit;
}

# Guardar el contenido del archivo .puml en el archivo temporal
print $temp_puml_fh $puml_content;
close $temp_puml_fh;

# Ejecutar PlantUML para generar la imagen SVG
my $plantuml_command = "java -jar /usr/local/bin/plantuml.jar -tsvg $temp_puml_file -o $output_dir";
eval {
    system($plantuml_command);
    1;
} or do {
    my $error = $@ || 'Error desconocido';
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print "<p><strong>Error:</strong> No se pudo generar el diagrama UML. Detalles: $error</p>";
    unlink $temp_puml_file;
    $dbh->disconnect;
    exit;
};

# Renombrar el archivo generado a diagrama.svg
my $generated_svg_file = $temp_puml_file;
$generated_svg_file =~ s/\.puml$/.svg/;

if (-e $generated_svg_file) {
    rename $generated_svg_file, $svg_file;

    # Leer el contenido del nuevo archivo SVG
    my $svg_content;
    {
        local $/; # Activar modo slurp para leer todo el archivo
        open my $fh, '<', $svg_file or do {
            print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
            print "<p><strong>Error:</strong> No se pudo leer el archivo SVG generado.</p>";
            unlink $temp_puml_file;
            $dbh->disconnect;
            exit;
        };
        $svg_content = <$fh>;
        close $fh;
    }

    # Actualizar la base de datos con el contenido del SVG
    my $update_sth = $dbh->prepare("UPDATE files SET content = ? WHERE id = ? AND user_id = ?");
    $update_sth->execute($svg_content, $row->{id}, $last_user_id);
    $update_sth->finish;

    # Mostrar enlace de descarga
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print <<HTML;
    <div>
        <p>¡Archivo procesado exitosamente!</p>
        <p>Descarga tu <a href="/puml_files/diagrama.svg">diagrama SVG</a></p>
    </div>
HTML
} else {
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print "<p><strong>Error:</strong> No se encontró la imagen SVG generada.</p>";
    unlink $temp_puml_file;
    $dbh->disconnect;
    exit;
}

# Cerrar la conexión a la base de datos
$dbh->disconnect;
