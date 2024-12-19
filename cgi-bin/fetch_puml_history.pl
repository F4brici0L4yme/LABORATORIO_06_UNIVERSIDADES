#!/usr/bin/perl -w

use strict;
use warnings;
use CGI;
use DBI;
use JSON;
use CGI::Session;

my $cgi = CGI->new;

my $dsn      = "DBI:mysql:database=puml_history;host=localhost";
my $username = "root";
my $password = "";

my $session = CGI::Session->new("driver:File", $cgi, { Directory => '/tmp/sessions' })
    or die "No se pudo iniciar la sesión: $!";

my $user_id = $session->param('user_id');
if (!$user_id) {
    print $cgi->header(-type => 'text/html');
    print "<h1>Error: No has iniciado sesión</h1>";
    exit;
}

my $dbh = DBI->connect($dsn, $username, $password, { RaiseError => 1, PrintError => 1 })
    or die "No se pudo conectar a la base de datos: $DBI::errstr";

my $action = $cgi->param('action') || '';

if ($action eq 'fetch') {
    fetch_records();
} elsif ($action eq 'insert') {
    insert_record();
} elsif ($action eq 'delete') {
    delete_record();
} elsif ($action eq 'update') {
    update_record();
} else {
    print_html();
}

$dbh->disconnect;

sub fetch_records {
    print $cgi->header('application/json');
    my $sth = $dbh->prepare("SELECT id, filename, content, created_at FROM files WHERE user_id = ? ORDER BY created_at DESC");
    $sth->execute($user_id);
    my @records;
    while (my $row = $sth->fetchrow_hashref) {
        push @records, $row;
    }
    print encode_json({ status => 'success', data => \@records });
}

sub insert_record {
    print $cgi->header('application/json');
    my $filename = $cgi->param('filename');

    unless ($filename && $filename =~ /\S/) {
        print encode_json({ status => 'error', message => "El nombre del archivo no puede estar vacío" });
        return;
    }

    eval {
        $dbh->do("INSERT INTO files (filename, content, user_id, created_at) VALUES (?, '', ?, NOW())", undef, $filename, $user_id);
        print encode_json({ status => 'success', message => 'Archivo agregado correctamente' });
    } or do {
        print encode_json({ status => 'error', message => $@ });
    };
}

sub delete_record {
    print $cgi->header('application/json');
    my $id = $cgi->param('id');

    eval {
        my $sth = $dbh->prepare("DELETE FROM files WHERE id = ? AND user_id = ?");
        $sth->execute($id, $user_id);
        if ($sth->rows > 0) {
            print encode_json({ status => 'success', message => 'Archivo eliminado correctamente' });
        } else {
            print encode_json({ status => 'error', message => 'No se pudo eliminar el archivo' });
        }
    } or do {
        print encode_json({ status => 'error', message => $@ });
    };
}

sub update_record {
    print $cgi->header('application/json');
    my $id       = $cgi->param('id');
    my $filename = $cgi->param('filename');
    my $content  = $cgi->param('content');

    unless ($filename && $filename =~ /\S/) {
        print encode_json({ status => 'error', message => "El nombre del archivo no puede estar vacío" });
        return;
    }

    eval {
        my $sth = $dbh->prepare("UPDATE files SET filename = ?, content = ? WHERE id = ? AND user_id = ?");
        $sth->execute($filename, $content, $id, $user_id);
        if ($sth->rows > 0) {
            print encode_json({ status => 'success', message => 'Archivo actualizado correctamente' });
        } else {
            print encode_json({ status => 'error', message => 'No se pudo actualizar el archivo' });
        }
    } or do {
        print encode_json({ status => 'error', message => "Error al actualizar el archivo: $@" });
    };
}

sub print_html {
    print $cgi->header('text/html');
    print <<'HTML';
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Historial de Archivos PUML</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #18263b;
            color: #fff;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            font-size: 2rem;
            color: #f4f4f9;
        }
        a {
            text-align: center;
            color: #f4f4f9;
            padding: 650px;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #18263b;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #29384d;
        }

        th {
            background-color: #18263b;
            color: #f4f4f9;
        }

        td {
            background-color: #2c3e50;
        }

        button {
            padding: 6px 12px;
            border: none;
            background-color: #1f2a3d;
            color: white;
            cursor: pointer;
            font-size: 1rem;
            margin: 5px;
            border-radius: 4px;
        }

        button:hover {
            background-color: #2d3b4c;
        }

        #edit-modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #18263b;
            padding: 20px;
            border: 1px solid #29384d;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 600px;
            z-index: 1000;
        }

        #edit-modal textarea {
            width: 100%;
            height: 150px;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #29384d;
            background-color: #2c3e50;
            color: #fff;
        }

        #edit-modal button {
            background-color: #1f2a3d;
        }

        #edit-modal button:hover {
            background-color: #2d3b4c;
        }
    </style>
</head>
<body>
    <h1>Historial de Archivos PUML</h1>
    <a href="/general.html">Volver al inicio</a>
    <table id="files-table">
        <thead>
            <tr>
                <th>Nombre del Archivo</th>
                <th>Fecha de Creacion</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
<div id="edit-modal">
    <h3>Editar Archivo</h3>
    <input type="text" id="edit-filename" placeholder="Nombre del archivo" />
    <textarea id="edit-content" placeholder="Contenido del archivo"></textarea>
    <button id="save-btn">Guardar</button>
    <button id="cancel-btn">Cancelar</button>
</div>

    <script>
    function fetchRecords() {
        $.post('', { action: 'fetch' }, function(response) {
            if (response.status === 'success') {
                let rows = '';
                response.data.forEach(function(record) {
                    rows += `
                        <tr>
                            <td>${record.filename}</td>
                            <td>${record.created_at}</td>
                            <td>
                                <button class="edit-btn" data-id="${record.id}" data-filename="${record.filename}" data-content="${record.content}">
                                    Editar
                                </button>
                                <button class="delete-btn" data-id="${record.id}">
                                    Eliminar
                                </button>
                            </td>
                        </tr>
                    `;
                });
                $('#files-table tbody').html(rows);
            }
        }, 'json');
    }

    $(document).on('click', '.edit-btn', function() {
        const id = $(this).data('id');
        const filename = $(this).data('filename');
        const content = $(this).data('content');
        
        $('#edit-modal').data('id', id).fadeIn();
        $('#edit-filename').val(filename);
        $('#edit-content').val(content);
    });

    $('#save-btn').on('click', function() {
        const id = $('#edit-modal').data('id');
        const filename = $('#edit-filename').val();
        const content = $('#edit-content').val();

        $.post('', { action: 'update', id: id, filename: filename, content: content }, function(response) {
            alert(response.message);
            $('#edit-modal').fadeOut();
            fetchRecords();
        }, 'json');
    });

    $('#cancel-btn').on('click', function() {
        $('#edit-modal').fadeOut();
    });

    $(document).on('click', '.delete-btn', function() {
        const id = $(this).data('id');
        if (confirm('¿Seguro que deseas eliminar este archivo?')) {
            $.post('', { action: 'delete', id: id }, function(response) {
                alert(response.message);
                fetchRecords();
            }, 'json');
        }
    });

    $(document).ready(fetchRecords);
    </script>
</body>
</html>
HTML
}
