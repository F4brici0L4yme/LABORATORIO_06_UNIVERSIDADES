#!C:/Strawberry/perl/bin/perl.exe
use strict;
use warnings;
use utf8;
use CGI;

# Crear objeto CGI
my $cgi = CGI->new;

# Leer el parámetro enviado por POST
my $java_code = $cgi->param('java_code');

# Imprimir encabezado HTTP y generar el HTML dinámico
print $cgi->header(-type => 'text/html', -charset => 'UTF-8');

print <<HTML;
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Código Java Recibido</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="text-center">Codigo Java Recibido</h1>
    <hr>
    <div class="well">
        <pre>$java_code</pre>
    </div>
    <div class="text-center">
        <a href="echo.pl" class="btn btn-primary">Volver</a>
    </div>
</div>
</body>
</html>
HTML