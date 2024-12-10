#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use DBI;
use Digest::SHA qw(sha256_hex);

# Configuración
my $dsn = "DBI:mysql:database=puml_history;host=localhost";
my $db_user = "root";
my $db_password = "";

# Crear objeto CGI
my $cgi = CGI->new;

# Obtener parámetros del formulario
my $username = $cgi->param('username');
my $password_input = $cgi->param('password');

# Validar parámetros
if (!$username || !$password_input) {
    print $cgi->header('text/html');
    print "<h1>Error: Todos los campos son obligatorios.</h1>";
    exit;
}

# Conexión a la base de datos
my $dbh = DBI->connect($dsn, $db_user, $db_password, { RaiseError => 1, AutoCommit => 1 })
    or die "No se pudo conectar a la base de datos: $DBI::errstr\n";

# Verificar si el usuario ya existe
my $sth_check = $dbh->prepare("SELECT id FROM users WHERE username = ?")
    or die "Error preparando la consulta: $DBI::errstr\n";
$sth_check->execute($username);

if (my $row = $sth_check->fetchrow_arrayref) {
    print $cgi->header('text/html');
    print "<h1>Error: El usuario '$username' ya existe.</h1>";
    $sth_check->finish;
    $dbh->disconnect;
    exit;
}
$sth_check->finish;

# Insertar nuevo usuario en la tabla
my $hashed_password = sha256_hex($password_input);
my $sth = $dbh->prepare("INSERT INTO users (username, password) VALUES (?, ?)")
    or die "Error preparando la consulta: $DBI::errstr\n";

eval {
    $sth->execute($username, $hashed_password);
};
if ($@) {
    print $cgi->header('text/html');
    print "<h1>Error al registrar el usuario: $@</h1>";
    $sth->finish;
    $dbh->disconnect;
    exit;
}

# Cerrar conexión a la base de datos
$sth->finish;
$dbh->disconnect;

# Redirigir al usuario a ./general.html
print $cgi->redirect('/general.html');
