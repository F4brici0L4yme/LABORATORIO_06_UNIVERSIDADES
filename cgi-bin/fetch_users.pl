#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use DBI;

# Configuración de conexión a la base de datos
my $dsn = "DBI:mysql:database=mydb;host=127.0.0.1";
my $username = "root";
my $password = "";  # Contraseña vacía para inicialización insegura

# Crear instancia CGI
my $cgi = CGI->new;
print $cgi->header('text/html');

# Conectar a la base de datos
my $dbh = DBI->connect($dsn, $username, $password, { RaiseError => 1, AutoCommit => 1 });

# Ejecutar consulta
my $sth = $dbh->prepare("SELECT id, name FROM users");
$sth->execute();

# Imprimir resultados
print "<html><body><h1>Usuarios</h1><ul>";
while (my @row = $sth->fetchrow_array) {
    print "<li>ID: $row[0], Nombre: $row[1]</li>";
}
print "</ul></body></html>";

# Limpiar
$sth->finish;
$dbh->disconnect;
