#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use File::Basename;
use DBI;

# Configuración de la carpeta y base de datos
my $input_dir = "../puml_files"; # Cambia esta ruta según tu entorno
my $dsn = "DBI:mysql:database=puml_history;host=localhost";
my $db_user = "root";
my $db_password = "";

# Crear objeto CGI
my $cgi = CGI->new;

# Imprimir encabezado HTTP
print $cgi->header(-type => 'text/html', -charset => 'UTF-8');

# Obtener el user_id (puede llegar como parámetro)
my $user_id = $cgi->param('user_id') || 1; # Por defecto 1 si no se proporciona
if (!$user_id) {
    print_error_and_exit("Error: Se debe proporcionar un user_id.");
}

# Conexión a la base de datos
my $dbh = DBI->connect($dsn, $db_user, $db_password, { RaiseError => 1, AutoCommit => 1 })
    or print_error_and_exit("No se pudo conectar a la base de datos: $DBI::errstr");

# Verificar si el user_id existe
my $sth_check_user = $dbh->prepare("SELECT id FROM users WHERE id = ?");
$sth_check_user->execute($user_id);
if (!$sth_check_user->fetchrow_array) {
    print_error_and_exit("Error: El user_id '$user_id' no existe en la base de datos.");
}
$sth_check_user->finish;

# Preparar consulta de inserción
my $sth = $dbh->prepare("INSERT INTO files (filename, content, user_id) VALUES (?, ?, ?)");

# Procesar archivos .puml
opendir(my $dh, $input_dir) or print_error_and_exit("No se puede abrir el directorio '$input_dir': $!");
while (my $file = readdir($dh)) {
    next unless ($file =~ /\.puml$/); # Solo archivos .puml
    my $filepath = "$input_dir/$file";

    # Leer contenido del archivo
    open(my $fh, '<', $filepath) or print_error_and_exit("No se pudo abrir el archivo '$filepath': $!");
    my $content = do { local $/; <$fh> }; # Leer todo el contenido
    close($fh);

    # Guardar en la base de datos
    eval {
        $sth->execute($file, $content, $user_id);
    };
    if ($@) {
        print_error_and_exit("No se pudo guardar el archivo '$file': $@");
    }
}
closedir($dh);

# Generar HTML dinámico
print <<HTML;
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diagrama Guardado</title>
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
    <div class="message">Diagrama guardado con éxito.</div>
    <a href="javascript:history.back();">Regresar a la página anterior</a>
</body>
</html>
HTML

# Cerrar conexión a la base de datos
$sth->finish;
$dbh->disconnect;

# Subrutina para imprimir un error en HTML
sub print_error_and_exit {
    my ($error_msg) = @_;
    print <<ERROR_HTML;
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
ERROR_HTML
    exit;
}
