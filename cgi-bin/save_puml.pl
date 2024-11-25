#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use DBI;

my $cgi = CGI->new;
print $cgi->header('text/plain');

# Obtener datos del formulario
my $filename = $cgi->param('filename');
my $content = $cgi->param('content');

# Conexión a la base de datos
my $dsn = "DBI:mysql:database=puml_history;host=localhost";
my $user = "root";
my $password = "root_password";

my $dbh = DBI->connect($dsn, $user, $password, { RaiseError => 1, AutoCommit => 1 });

# Insertar datos en la tabla
my $sth = $dbh->prepare("INSERT INTO files (filename, content) VALUES (?, ?)");
$sth->execute($filename, $content);

print "Archivo $filename guardado en el historial.\n";

$sth->finish;
$dbh->disconnect;
