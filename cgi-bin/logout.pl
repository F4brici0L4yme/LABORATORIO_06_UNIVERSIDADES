#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use CGI::Session;

# Crear objeto CGI
my $cgi = CGI->new;

# Recuperar sesión
my $session = CGI::Session->new("driver:File", $cgi, {Directory => '/tmp'});
$session->delete();
$session->flush;
# Redirigir al formulario de inicio de sesión
print $cgi->redirect('/index.html');
