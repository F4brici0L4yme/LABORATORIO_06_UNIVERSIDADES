#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use CGI::Session;

my $cgi = CGI->new;

# Cargar la sesión
my $session = CGI::Session->new(undef, $cgi, { Directory => '/tmp/sessions' });

if ($session) {
    $session->delete();  # Eliminar los datos de la sesión
    $session->flush();   # Asegurarse de que la sesión se termine
    print $cgi->redirect('/index.html');  # Redirigir a un archivo HTML especificado
} else {
    # Si no hay sesión activa, solo redirigir
    print $cgi->redirect('/index.html');
}

exit;
