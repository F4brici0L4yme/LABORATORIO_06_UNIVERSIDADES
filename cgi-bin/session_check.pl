#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use CGI::Session;

my $cgi = CGI->new;
my $session = CGI::Session->new("driver:File", $cgi, {Directory => '/tmp'});

# Verificar si la sesión es válida
if ($session->param('logged_in')) {
    print $cgi->header('text/html');
    print "<h1>Bienvenido, " . $session->param('username') . "!</h1>";
} else {
    print $cgi->redirect('/index.html');
}
