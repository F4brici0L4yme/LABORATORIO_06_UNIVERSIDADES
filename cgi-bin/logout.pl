#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use CGI::Session;

my $cgi = CGI->new;

my $session = CGI::Session->new(undef, $cgi, { Directory => '/tmp/sessions' });

if ($session) {
    $session->delete();
    $session->flush();
    print $cgi->redirect('/index.html');
} else {
    print $cgi->redirect('/index.html');
}

exit;
