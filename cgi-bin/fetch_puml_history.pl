#!/usr/bin/perl -w

use strict;
use warnings;
use CGI;
use DBI;
use JSON;
use CGI::Session;

my $cgi = CGI->new;

# Crear sesión
my $session = CGI::Session->new("driver:File", $cgi, { Directory => '/tmp/sessions' })
    or die "No se pudo iniciar la sesión: $!";

# Obtener el user_id del usuario conectado
my $user_id = $session->param('user_id');

if (!$user_id) {
    print $cgi->header(-type => 'text/html');
    print "<h1>Error: No has iniciado sesión</h1>";
    exit;
}

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
} elsif ($action eq 'update') {
    update_record();
} elsif ($action eq 'delete') {
    delete_record();
} else {
    print_html();
}

$dbh->disconnect;

# Subrutina para obtener registros
sub fetch_records {
    print $cgi->header('application/json');
    my $sth = $dbh->prepare("SELECT id, filename, created_at FROM files WHERE user_id = ? ORDER BY created_at DESC");
    $sth->execute($user_id);
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
        $dbh->do("INSERT INTO files (filename, content, user_id, created_at) VALUES (?, '', ?, NOW())", undef, $filename, $user_id);
        print encode_json({ status => 'success', message => 'Archivo agregado correctamente' });
    } or do {
        print encode_json({ status => 'error', message => $@ });
    };
}

# Subrutina para actualizar un registro
sub update_record {
    print $cgi->header('application/json');
    my $id       = $cgi->param('id');
    my $filename = $cgi->param('filename');

    eval {
        my $sth = $dbh->prepare("UPDATE files SET filename = ? WHERE id = ? AND user_id = ?");
        $sth->execute($filename, $id, $user_id);
        if ($sth->rows > 0) {
            print encode_json({ status => 'success', message => 'Archivo actualizado correctamente' });
        } else {
            print encode_json({ status => 'error', message => 'No se pudo actualizar el archivo' });
        }
    } or do {
        print encode_json({ status => 'error', message => $@ });
    };
}

# Subrutina para eliminar un registro
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
        table { border-collapse: collapse; width: 100%; }
        table, th, td { border: 1px solid black; }
        th, td { padding: 10px; text-align: center; }
        .editable { background-color: #f0f0f0; }
        button { margin: 5px; }
    </style>
</head>
<body>
    <h1>Historial de Archivos PUML</h1>
    <form id="add-form">
        <input type="text" id="filename" placeholder="Nombre del Archivo" required>
        <button type="submit">Agregar Archivo</button>
    </form>
    <hr>
    <table id="files-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre del Archivo</th>
                <th>Fecha de Creación</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>

    <script>
        function fetchRecords() {
            $.post('', { action: 'fetch' }, function(response) {
                if (response.status === 'success') {
                    let rows = '';
                    response.data.forEach(function(record) {
                        rows += `
                            <tr>
                                <td>${record.id}</td>
                                <td contenteditable="true" class="editable">${record.filename}</td>
                                <td>${record.created_at}</td>
                                <td>
                                    <button class="update-btn" data-id="${record.id}">Actualizar</button>
                                    <button class="delete-btn" data-id="${record.id}">Eliminar</button>
                                </td>
                            </tr>
                        `;
                    });
                    $('#files-table tbody').html(rows);
                }
            }, 'json');
        }

        $('#add-form').on('submit', function(e) {
            e.preventDefault();
            const filename = $('#filename').val();
            $.post('', { action: 'insert', filename: filename }, function(response) {
                alert(response.message);
                fetchRecords();
                $('#filename').val('');
            }, 'json');
        });

        $(document).on('click', '.update-btn', function() {
            const row = $(this).closest('tr');
            const id = $(this).data('id');
            const filename = row.find('td:eq(1)').text().trim();
            $.post('', { action: 'update', id: id, filename: filename }, function(response) {
                alert(response.message);
                fetchRecords();
            }, 'json');
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
