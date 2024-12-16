#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use CGI::Session;
use DBI;
use Digest::SHA qw(sha256_hex);

my $cgi = CGI->new;

# Recuperar los datos del formulario
my $username = $cgi->param('username');
my $password = $cgi->param('password');

# Validación básica de campos
if (!$username || !$password) {
    print $cgi->redirect('/index.html');
    exit;
}

# Conexión a la base de datos
my $dsn = "DBI:mysql:database=puml_history;host=localhost;port=3306";
my $db_user = "root";
my $db_pass = "";
my $dbh = DBI->connect($dsn, $db_user, $db_pass, { RaiseError => 1, AutoCommit => 1 })
    or die "No se pudo conectar a la base de datos: $DBI::errstr";

# Verificar si el usuario ya existe
my $sth_check = $dbh->prepare("SELECT id, password FROM users WHERE username = ?");
$sth_check->execute($username);
my ($user_id, $stored_password) = $sth_check->fetchrow_array;

if ($user_id) {
    # Usuario existente, verificar contraseña
    if (sha256_hex($password) eq $stored_password) {
        # Crear o reanudar la sesión
        my $session = CGI::Session->new(undef, $cgi, { Directory => '/tmp/sessions' })
            or die CGI::Session->errstr;
        $session->param('username', $username);
        $session->param('user_id', $user_id);
        $session->expire('+1h');

        my $cookie = $cgi->cookie(CGISESSID => $session->id);
        print $cgi->redirect(-uri => '/general.html', -cookie => $cookie);
    } else {
        # Contraseña incorrecta, mostrar alerta y redirigir
        print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
        print <<'HTML';
        <html>
        <head>
            <script type="text/javascript">
                alert("Contraseña incorrecta");
                window.location.href = "/index.html";  // Redirigir a index.html después del alert
            </script>
        </head>
        <body>
        </body>
        </html>
HTML
    }
} else {
    # Usuario nuevo, registrar e iniciar sesión
    my $hashed_password = sha256_hex($password);
    my $sth_insert = $dbh->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
    $sth_insert->execute($username, $hashed_password);

    # Obtener el ID del nuevo usuario
    $user_id = $dbh->last_insert_id(undef, undef, "users", undef);

    # Crear la sesión
    my $session = CGI::Session->new(undef, $cgi, { Directory => '/tmp/sessions' })
        or die CGI::Session->errstr;
    $session->param('username', $username);
    $session->param('user_id', $user_id);
    $session->expire('+1h');

    my $cookie = $cgi->cookie(CGISESSID => $session->id);
    print $cgi->redirect(-uri => '/general.html', -cookie => $cookie);
}

# Limpieza
$sth_check->finish;
$dbh->disconnect;

exit;
