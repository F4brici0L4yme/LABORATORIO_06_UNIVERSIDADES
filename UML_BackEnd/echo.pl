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
    <style>
        .panel-title {
            cursor: pointer;
        }
        .panel-body {
            display: none;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center">Generador de Diagramas UML</h1>
    <hr>
    <form id="umlForm" class="form-horizontal" action="generator_uml.pl" method="post">
        <!-- Sección de Main -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title" data-toggle="collapse" data-target="#mainBox">Main</h4>
            </div>
            <div id="mainBox" class="panel-body">
                <textarea id="javaCodeMain" name="java_code_main" class="form-control" rows="20" placeholder="Escribe el código de la clase Main aquí..."></textarea>
            </div>
        </div>

        <!-- Sección de Herencia -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title" data-toggle="collapse" data-target="#inheritanceBox">Herencia</h4>
            </div>
            <div id="inheritanceBox" class="panel-body">
                <textarea id="javaCodeInheritance" name="java_code_inheritance" class="form-control" rows="20" placeholder="Escribe el código de la clase Herencia aquí..."></textarea>
            </div>
        </div>

        <!-- Sección de Interfaces -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title" data-toggle="collapse" data-target="#interfaceBox">Interfaces</h4>
            </div>
            <div id="interfaceBox" class="panel-body">
                <textarea id="javaCodeInterface" name="java_code_interface" class="form-control" rows="20" placeholder="Escribe el código de las Interfaces aquí..."></textarea>
            </div>
        </div>

        <!-- Sección de Clases -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title" data-toggle="collapse" data-target="#classBox">Clases</h4>
            </div>
            <div id="classBox" class="panel-body">
                <textarea id="javaCodeClass" name="java_code_class" class="form-control" rows="20" placeholder="Escribe el código de las Clases aquí..."></textarea>
            </div>
        </div>

        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary">Generar UML</button>
        </div>
    </form>
    <hr>
</div>

<script>
$(document).ready(function() {
    // Aseguramos que las cajas de texto estén ocultas al principio
    $('.panel-body').hide();

    // Manejamos el clic en los títulos para mostrar/ocultar las cajas de texto
    $('.panel-title').on('click', function() {
        var target = $(this).data('target');
        $(target).toggle();  // Cambiar visibilidad del panel correspondiente
    });
});
</script>
</body>
</html>
EOF

