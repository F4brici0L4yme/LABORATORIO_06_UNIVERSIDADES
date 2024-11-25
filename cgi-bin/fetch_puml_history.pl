#!/usr/bin/perl -w

use strict;
use warnings;
use CGI;
use DBI;

my $cgi = CGI->new;
print $cgi->header('text/html');

# Conexión a la base de datos
my $dsn = "DBI:mysql:database=puml_history;host=localhost";
my $user = "root";
my $password = "root_password";

my $dbh = DBI->connect($dsn, $user, $password, { RaiseError => 1, AutoCommit => 1 });

# Recuperar datos de la tabla
my $sth = $dbh->prepare("SELECT filename, created_at FROM files ORDER BY created_at DESC");
$sth->execute();

print "<html><head><title>Historial de Archivos PUML</title></head><body>";
print "<h1>Historial de Archivos PUML</h1>";
print "<table border='1'><tr><th>Nombre del Archivo</th><th>Fecha de Creación</th></tr>";

while (my $row = $sth->fetchrow_hashref) {
    print "<tr><td>$row->{filename}</td><td>$row->{created_at}</td></tr>";
}

print "</table></body></html>";

$sth->finish;
$dbh->disconnect;
