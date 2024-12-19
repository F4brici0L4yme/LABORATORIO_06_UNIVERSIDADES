#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use CGI::Session;
use DBI;
use JSON;

my $input_dir = "../puml_files";
my $dsn = "DBI:mysql:database=puml_history;host=localhost";
my $db_user = "root";
my $db_pass = "";

my $cgi = CGI->new;

my $session = CGI::Session->new(undef, $cgi, { Directory => '/tmp/sessions' })
    or return_json_response("error", "No se pudo iniciar la sesión: " . CGI::Session->errstr);

my $user_id = $session->param('user_id');
if (!$user_id) {
    return_json_response("error", "Debes iniciar sesión para agregar archivos.");
}

my $filename = $cgi->param('filename');
if (!$filename) {
    return_json_response("error", "El nombre del archivo es obligatorio.");
}

my $dbh = DBI->connect($dsn, $db_user, $db_pass, { RaiseError => 1, AutoCommit => 1 })
    or return_json_response("error", "No se pudo conectar a la base de datos: $DBI::errstr");

my $sth_check_user = $dbh->prepare("SELECT id FROM users WHERE id = ?");
$sth_check_user->execute($user_id);
if (!$sth_check_user->fetchrow_array) {
    $sth_check_user->finish;
    return_json_response("error", "El usuario con ID '$user_id' no existe.");
}
$sth_check_user->finish;

my $sth_insert_file = $dbh->prepare("INSERT INTO files (filename, content, user_id) VALUES (?, ?, ?)");

my $file_saved = 0;

opendir(my $dh, $input_dir) or return_json_response("error", "No se puede abrir el directorio '$input_dir': $!");
while (my $file = readdir($dh)) {
    next unless ($file =~ /\.puml$/);
    my $filepath = "$input_dir/$file";

    open(my $fh, '<', $filepath) or return_json_response("error", "No se pudo abrir el archivo '$filepath': $!");
    my $content = do { local $/; <$fh> };
    close($fh);

    eval {
        $sth_insert_file->execute($filename, $content, $user_id);
    };
    if ($@) {
        return_json_response("error", "No se pudo guardar el archivo '$filename': $@");
    } else {
        $file_saved = 1;
    }
}
closedir($dh);

$sth_insert_file->finish;
$dbh->disconnect;

if ($file_saved) {
    return_json_response("success", "Archivos guardados exitosamente.");
} else {
    return_json_response("error", "No se guardaron archivos. Verifica el directorio de entrada.");
}

sub return_json_response {
    my ($status, $message) = @_;
    print $cgi->header(-type => 'application/json', -charset => 'UTF-8');
    print encode_json({ status => $status, message => $message });
    exit;
}
