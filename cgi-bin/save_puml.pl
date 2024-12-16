#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use CGI::Session;
use DBI;

# Configuración
my $input_dir = "../puml_files";  # Ruta de entrada para archivos .puml
my $dsn = "DBI:mysql:database=puml_history;host=localhost";
my $db_user = "root";
my $db_pass = "";

# Crear objeto CGI
my $cgi = CGI->new;

# Crear o cargar sesión
my $session = CGI::Session->new(undef, $cgi, { Directory => '/tmp/sessions' })
    or die "No se pudo iniciar la sesión: " . CGI::Session->errstr;

# Verificar si el usuario está autenticado
my $user_id = $session->param('user_id');
if (!$user_id) {
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print <<"HTML";
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Error de Autenticación</title>
</head>
<body>
    <h2 style="color: red;">Error: Debes iniciar sesión para agregar archivos.</h2>
    <a href="/index.html">Iniciar Sesión</a>
</body>
</html>
HTML
    exit;
}

# Conexión a la base de datos
my $dbh = DBI->connect($dsn, $db_user, $db_pass, { RaiseError => 1, AutoCommit => 1 })
    or print_error_and_exit("No se pudo conectar a la base de datos: $DBI::errstr");

# Verificar que el usuario existe en la base de datos
my $sth_check_user = $dbh->prepare("SELECT id FROM users WHERE id = ?");
$sth_check_user->execute($user_id);
if (!$sth_check_user->fetchrow_array) {
    print_error_and_exit("Error: El usuario con ID '$user_id' no existe.");
}
$sth_check_user->finish;

# Preparar consulta para insertar archivos
my $sth_insert_file = $dbh->prepare("INSERT INTO files (filename, content, user_id) VALUES (?, ?, ?)");

# Procesar archivos .puml
my $file_saved = 0;  # Indica si se guardó al menos un archivo

opendir(my $dh, $input_dir) or print_error_and_exit("No se puede abrir el directorio '$input_dir': $!");
while (my $file = readdir($dh)) {
    next unless ($file =~ /\.puml$/);  # Solo procesar archivos con extensión .puml
    my $filepath = "$input_dir/$file";

    # Leer contenido del archivo
    open(my $fh, '<', $filepath) or print_error_and_exit("No se pudo abrir el archivo '$filepath': $!");
    my $content = do { local $/; <$fh> };  # Leer todo el contenido del archivo
    close($fh);

    # Guardar el archivo en la base de datos
    eval {
        $sth_insert_file->execute($file, $content, $user_id);
    };
    if ($@) {
        print_error_and_exit("No se pudo guardar el archivo '$file': $@");
    } else {
        $file_saved = 1;  # Marcar que al menos un archivo fue guardado
    }
}
closedir($dh);

# Mostrar mensaje de éxito si se guardó algún archivo
if ($file_saved) {
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print <<"HTML";
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Archivos Guardados</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 50px;
        }
        a {
            text-decoration: none;
            color: #007BFF;
            font-size: 1.2em;
        }
        a:hover {
            text-decoration: underline;
        }
        .message {
            font-size: 1.5em;
            color: green;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="message">Archivos guardados exitosamente.</div>
    <a href="/general.html">Volver al perfil</a>
</body>
</html>
HTML
} else {
    print_error_and_exit("No se guardaron archivos. Verifica el directorio de entrada.");
}

# Finalizar y cerrar conexiones
$sth_insert_file->finish;
$dbh->disconnect;

# Subrutina para imprimir un error en HTML
sub print_error_and_exit {
    my ($error_msg) = @_;
    print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
    print <<"HTML";
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Error</title>
</head>
<body>
    <h2 style="color: red;">$error_msg</h2>
    <a href="javascript:history.back();">Regresar</a>
</body>
</html>
HTML
    exit;
}
