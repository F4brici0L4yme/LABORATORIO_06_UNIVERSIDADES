#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use CGI::Session;

my $cgi = CGI->new;
print $cgi->header(-type => 'text/html', -charset => 'UTF-8');

# Load the session
my $session = CGI::Session->new(undef, $cgi, { Directory => '/tmp/sessions' });

if ($session) {
    $session->delete();  # Delete the session data
    $session->flush();   # Ensure session is terminated
    print "<h1>Sesión Cerrada</h1>";
    print "<p>Has cerrado sesión exitosamente.</p>";
    print "<a href='/index.html'>Volver al inicio</a>";
} else {
    print "<h1>Error</h1>";
    print "<p>No se encontró ninguna sesión activa.</p>";
}

exit;
