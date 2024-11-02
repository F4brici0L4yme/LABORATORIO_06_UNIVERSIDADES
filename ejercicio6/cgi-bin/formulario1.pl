#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
my $q = CGI->new;
my $latitud = $q->param('latitud');
$latitud = CGI::escape($latitud);
my $longitud = $q->param('longitud');
$longitud = CGI::escape($longitud);
print $q->redirect("https://www.google.com/maps/place/12°03'21.7\"S+77°05'03.9\"W/@-12.0560278,-77.0869916,17z/data=!3m1!4b1!4m4!3m3!8m2!3d-12.0560278!4d-77.0844167?entry=ttu&g_ep=EgoyMDI0MTAyOS4wIKXMDSoASAFQAw%3D%3D");
