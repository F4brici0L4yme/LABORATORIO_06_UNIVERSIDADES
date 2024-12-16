#!/usr/bin/perl -w

use strict;
use warnings;
use CGI;
use DBI;
use JSON;

my $cgi = CGI->new;

# Conexión a la base de datos
my $dsn      = "DBI:mysql:database=puml_history;host=localhost";
my $username = "root";
my $password = "";

my $dbh = DBI->connect($dsn, $username, $password, { RaiseError => 1, PrintError => 0 });

# Acción recibida del frontend
my $action = $cgi->param('action') || '';

# Manejo de acciones CRUD
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

# Subrutina para obtener registros
sub fetch_records {
    print $cgi->header('application/json');
    my $sth = $dbh->prepare("SELECT id, filename, content, created_at FROM files ORDER BY created_at DESC");
    $sth->execute();
    my @records;
    while (my $row = $sth->fetchrow_hashref) {
        push @records, $row;
    }
    print encode_json({ status => 'success', data => \@records });
}

# Subrutina para insertar un registro
sub insert_record {
    print $cgi->header('application/json');
    my $filename = $cgi->param('filename');

    eval {
        $dbh->do("INSERT INTO files (filename, content, created_at) VALUES (?, '', NOW())", undef, $filename);
        print encode_json({ status => 'success', message => 'Archivo agregado correctamente' });
    } or do {
        print encode_json({ status => 'error', message => $@ });
    };
}

# Subrutina para eliminar un registro
sub delete_record {
    print $cgi->header('application/json');
    my $id = $cgi->param('id');

    eval {
        my $sth = $dbh->prepare("DELETE FROM files WHERE id = ?");
        $sth->execute($id);
        if ($sth->rows > 0) {
            print encode_json({ status => 'success', message => 'Archivo eliminado correctamente' });
        } else {
            print encode_json({ status => 'error', message => 'No se pudo eliminar el archivo' });
        }
    } or do {
        print encode_json({ status => 'error', message => $@ });
    };
}

# Subrutina para actualizar un registro
# Subrutina para actualizar un registro
sub update_record {
    print $cgi->header('application/json');
    my $id      = $cgi->param('id');
    my $filename = $cgi->param('filename');
    my $content = $cgi->param('content');

    eval {
        my $sth = $dbh->prepare("UPDATE files SET filename = ?, content = ? WHERE id = ?");
        $sth->execute($filename, $content, $id);
        if ($sth->rows > 0) {
            print encode_json({ status => 'success', message => 'Archivo actualizado correctamente' });
        } else {
            print encode_json({ status => 'error', message => 'No se pudo actualizar el archivo' });
        }
    } or do {
        print encode_json({ status => 'error', message => $@ });
    };
}

# Subrutina para generar HTML dinámico
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
            background-color: #18263b; /* Azul oscuro */
            color: #fff; /* Texto blanco para buen contraste */
            margin: 0;
            padding: 0;
        }

        h1, a {
            text-align: center;
            margin: 20px 0;
            font-size: 2rem;
            color: #f4f4f9; /* Color claro para el título */
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #18263b; /* Mismo tono oscuro */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #29384d; /* Azul intermedio */
        }

        th {
            background-color: #18263b; /* Azul oscuro */
            color: #f4f4f9; /* Blanco para las cabeceras */
        }

        td {
            background-color: #2c3e50; /* Azul más oscuro para las celdas */
        }

        button {
            padding: 6px 12px;
            border: none;
            background-color: #1f2a3d; /* Azul intermedio oscuro */
            color: white;
            cursor: pointer;
            font-size: 1rem;
            margin: 5px;
            border-radius: 4px;
        }

        button:hover {
            background-color: #2d3b4c; /* Azul más brillante al pasar el mouse */
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
            background-color: #2c3e50; /* Azul más oscuro */
            color: #fff; /* Texto en blanco */
        }

        #edit-modal button {
            background-color: #1f2a3d; /* Azul intermedio oscuro */
        }

        #edit-modal button:hover {
            background-color: #2d3b4c; /* Azul más brillante */
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
        <textarea id="edit-content"></textarea>
        <button id="save-btn">Guardar</button>
        <button id="cancel-btn">Cancelar</button>
    </div>

    <script>
    // Obtener registros y mostrarlos
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

    // Evento para editar el archivo
    $(document).on('click', '.edit-btn', function() {
        const id = $(this).data('id');
        const filename = $(this).data('filename');
        const content = $(this).data('content');
        
        // Mostrar el modal de edición con el nombre del archivo y contenido
        $('#edit-modal').data('id', id).fadeIn();
        $('#edit-filename').val(filename);
        $('#edit-content').val(content);
    });

    // Guardar cambios (nombre y contenido)
    $('#save-btn').on('click', function() {
        const id = $('#edit-modal').data('id');
        const filename = $('#edit-filename').val();
        const content = $('#edit-content').val();
        
        // Enviar la actualización al servidor
        $.post('', { action: 'update', id: id, filename: filename, content: content }, function(response) {
            alert(response.message);
            $('#edit-modal').fadeOut();
            fetchRecords();
        }, 'json');
    });

    // Cancelar la edición
    $('#cancel-btn').on('click', function() {
        $('#edit-modal').fadeOut();
    });

    // Eliminar archivo
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
