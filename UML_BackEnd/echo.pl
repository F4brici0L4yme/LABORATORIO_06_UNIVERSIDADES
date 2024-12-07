#!C:/Strawberry/perl/bin/perl.exe
use strict;
use warnings;
use utf8;
use open ':std', ':encoding(UTF-8)';
binmode STDOUT, ':utf8';

print <<'EOF';
Content-type: text/html

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generador de UML</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <h1 class="text-center">Generador de Diagramas UML</h1>
    <hr>
    <form id="umlForm" class="form-horizontal" action="generate_uml.pl" method="post">
        <div class="form-group">
            <label for="javaCode" class="col-sm-2 control-label">Código Java:</label>
            <div class="col-sm-10">
                <textarea id="javaCode" name="java_code" class="form-control" rows="10" placeholder="Escribe tu código Java aquí..."></textarea>
            </div>
        </div>
        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary">Generar UML</button>
        </div>
    </form>
    <hr>
</div>
</body>
</html>
EOF
