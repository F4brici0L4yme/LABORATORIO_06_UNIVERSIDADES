#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use DBI;

my $cgi = CGI->new;
print $cgi->header('text/html');  # Usar correctamente el objeto CGI

# Obtener datos del formulario
my $filename = $cgi->param('filename');
my $content = $cgi->param('content');

# Validar parámetros
if (!$filename || !$content) {
    print "Error: Parámetros 'filename' y 'content' son obligatorios.\n";
    exit;
}

# Conexión a la base de datos
my $dsn = "DBI:mysql:database=puml_history;host=localhost";
my $user = "root";
my $password = "root_password";

my $dbh = DBI->connect($dsn, $user, $password, { RaiseError => 1, AutoCommit => 1 })
    or die "No se pudo conectar a la base de datos: $DBI::errstr\n";

# Insertar datos en la tabla
my $sth = $dbh->prepare("INSERT INTO files (filename, content) VALUES (?, ?)")
    or die "Error preparando la consulta: $DBI::errstr\n";

$sth->execute($filename, $content)
    or die "Error ejecutando la consulta: $DBI::errstr\n";

print << "FORM";
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Historial PUML</title>
</head>
<body>
    <h1>Subir Archivo PUML</h1>
    <form action="../cgi-bin/save_puml.pl" method="get">
        <label for="filename">Nombre del Archivo:</label>
        <input type="text" id="filename" name="filename" required><br><br>
        <label for="content">Contenido:</label><br>
        <textarea id="content" name="content" rows="10" cols="50" required></textarea><br><br>
        <button type="submit">Guardar</button>
    </form>
    <hr>
    <h2>Ver Historial</h2>
    <a href="../cgi-bin/fetch_puml_history.pl">Ver Historial de Archivos PUML</a>
    <h2>Archivo guardado</h2>
</body>
</html>
FORM
$sth->finish;
$dbh->disconnect;
