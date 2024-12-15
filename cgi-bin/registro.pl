#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use DBI;
use Digest::SHA qw(sha256_hex);
use CGI::Session;

# Configuración de la base de datos
my $dsn        = "DBI:mysql:database=puml_history;host=localhost";
my $db_user    = "root";
my $db_password = "";

# Crear objeto CGI
my $cgi = CGI->new;

# Crear sesión
my $session = CGI::Session->new("driver:File", undef, {Directory => '/tmp'}) or die CGI::Session->errstr;
$session->delete(); # Ensure no residual data
$session = CGI::Session->new("driver:File", undef, {Directory => '/tmp'}) or die CGI::Session->errstr;


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
my $sth_check = $dbh->prepare("SELECT id FROM users WHERE username = ?");
$sth_check->execute($username);

if (my $row = $sth_check->fetchrow_arrayref) {
    # Usuario existe, validar contraseña
    my $sth_validate = $dbh->prepare("SELECT id, password FROM users WHERE username = ?");
    $sth_validate->execute($username);
    my ($user_id, $stored_password) = $sth_validate->fetchrow_array;

    if (sha256_hex($password_input) eq $stored_password) {
        # Contraseña correcta, establecer sesión
        $session->param('logged_in', 1);
        $session->param('username', $username);
        $session->param('user_id', $user_id);
        $session->expire('+1h'); # Sesión válida por 1 hora
        
        print $cgi->redirect('/general.html');
    } else {
        print $cgi->header('text/html');
        print "<h1>Error: Contraseña incorrecta.</h1>";
    }
    $sth_validate->finish;
} else {
    # Registrar nuevo usuario
    my $hashed_password = sha256_hex($password_input);
    my $sth_insert = $dbh->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
    eval {
        $sth_insert->execute($username, $hashed_password);
        # Crear sesión para el nuevo usuario
        my $user_id = $dbh->{'mysql_insertid'};
        $session->param('logged_in', 1);
        $session->param('username', $username);
        $session->param('user_id', $user_id);
        $session->expire('+1h');

        print $cgi->redirect('/general.html');
    };
    if ($@) {
        print $cgi->header('text/html');
        print "<h1>Error al registrar el usuario: $@</h1>";
    }
    $sth_insert->finish;
}

# Cerrar conexión
$sth_check->finish;
$dbh->disconnect;
