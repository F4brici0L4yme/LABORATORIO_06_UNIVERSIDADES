#!/usr/bin/perl -w
use strict;
use warnings;
use File::Basename;
use DBI;

# Configuración de la carpeta y base de datos
my $input_dir = "../puml_files"; # Cambia esta ruta según tu entorno
my $dsn = "DBI:mysql:database=puml_history;host=localhost";
my $db_user = "root";
my $db_password = "";

# Obtener el user_id como parámetro (esto debe ser proporcionado, por ejemplo, desde una sesión)
my $user_id = 1; # Supone que se pasa como argumento en la línea de comandos
if (!$user_id) {
    die "Error: Se debe proporcionar un user_id como argumento.\n";
}

# Conexión a la base de datos
my $dbh = DBI->connect($dsn, $db_user, $db_password, { RaiseError => 1, AutoCommit => 1 })
    or die "No se pudo conectar a la base de datos: $DBI::errstr\n";

# Verificar si el user_id existe
my $sth_check_user = $dbh->prepare("SELECT id FROM users WHERE id = ?")
    or die "Error preparando la consulta de verificación de usuario: $DBI::errstr\n";
$sth_check_user->execute($user_id);
if (!$sth_check_user->fetchrow_array) {
    die "Error: El user_id '$user_id' no existe en la base de datos.\n";
}
$sth_check_user->finish;

# Preparar consulta de inserción
my $sth = $dbh->prepare("INSERT INTO files (filename, content, user_id) VALUES (?, ?, ?)")
    or die "Error preparando la consulta de inserción: $DBI::errstr\n";

# Leer archivos .puml de la carpeta
opendir(my $dh, $input_dir) or die "No se puede abrir el directorio '$input_dir': $!\n";
while (my $file = readdir($dh)) {
    next unless ($file =~ /\.puml$/); # Procesar solo archivos .puml
    my $filepath = "$input_dir/$file";

    # Leer contenido del archivo
    open(my $fh, '<', $filepath) or die "No se pudo abrir el archivo '$filepath': $!\n";
    my $content = do { local $/; <$fh> }; # Leer todo el contenido del archivo
    close($fh);

    # Guardar en la base de datos
    eval {
        $sth->execute($file, $content, $user_id);
        print "Archivo '$file' guardado en la base de datos con user_id '$user_id'.\n";
    };
    if ($@) {
        warn "No se pudo guardar el archivo '$file': $@\n";
    }
}
closedir($dh);

# Cerrar conexión a la base de datos
$sth->finish;
$dbh->disconnect;

print "Todos los archivos .puml procesados.\n";
