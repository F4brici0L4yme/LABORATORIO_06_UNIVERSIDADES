    <div align="center">
<table>
    <theader>
        <tr>
            <td><img src="https://github.com/rescobedoq/pw2/blob/main/epis.png?raw=true" alt="EPIS" style="width:50%; height:auto"/></td>
            <th>
                <span style="font-weight:bold;">UNIVERSIDAD NACIONAL DE SAN AGUSTIN</span><br />
                <span style="font-weight:bold;">FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS</span><br />
                <span style="font-weight:bold;">DEPARTAMENTO ACADÉMICO DE INGENIERÍA DE SISTEMAS E INFORMÁTICA</span><br />
                <span style="font-weight:bold;">ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMAS</span>
            </th>
            <td><img src="https://raw.githubusercontent.com/rescobedoq/pw2/refs/heads/main/abet.png" alt="ABET" style="width:50%; height:auto"/></td>
        </tr>
    </theader>
    <tbody>
        <tr><td colspan="3"><span style="font-weight:bold;">Formato</span>: Guía de Práctica de Laboratorio</td></tr>
        <tr><td><span style="font-weight:bold;">Aprobación</span>:  2022/03/01</td><td><span style="font-weight:bold;">Código</span>: GUIA-PRLD-001</td><td><span style="font-weight:bold;">Página</span>: 1</td></tr>
    </tbody>
</table>
</div>

<div align="center">
<span style="font-weight:bold;">TRABAJO FINAL</span><br />
</div>


<table>
<theader>
<tr><th colspan="6">INFORMACIÓN BÁSICA</th></tr>
</theader>
<tbody>
<tr><td>ASIGNATURA:</td><td colspan="5">Programación Web 2</td></tr>
<tr><td>TÍTULO DE LA PRÁCTICA:</td><td colspan="5"> Generador de Diagramas UML - Perl - Javascript - DBI - Session - CGI - AJAX - Bootstrap</td></tr>
<tr>
<td>NÚMERO DE PRÁCTICA:</td><td>07</td><td>AÑO LECTIVO:</td><td>2024 B</td><td>NRO. SEMESTRE:</td><td>II</td>
</tr>
<tr>
<td>FECHA INICIO::</td><td>20-Nov-2024</td><td>FECHA FIN:</td><td>16-Dic-2024</td><td>DURACIÓN:</td><td>10 horas</td>
</tr>
<tr><td colspan="6">RECURSOS:
    <ul>
        <li><a href="https://git-scm.com/book/es/v2">https://git-scm.com/book/es/v2</a></li>
        <li><a href="https://guides.github.com/">https://guides.github.com/</a></li>        
        <li><a 
href="https://www.geeksforgeeks.org/perl-tutorial-learn-perl-with-examples/">https://www.geeksforgeeks.org/perl-tutorial-learn-perl-with-examples/</a></li>
        <li><a           href="https://www2.iib.uam.es/bioinfo/curso/perl/tutoriales/cicei/cap6.htm">https://www2.iib.uam.es/bioinfo/curso/perl/tutoriales/cicei/cap6.htm</a></li>
        <li><a           href="https://getbootstrap.com/">https://getbootstrap.com/</a></li>
        <li><a
href="https://www.w3schools.com/html/">https://www.w3schools.com/html/</a></li>
        <li><a     href="https://www.w3schools.com/css/">https://www.w3schools.com/css/</a></li>
        <li><a href="https://metacpan.org/pod/CGI::Session">https://metacpan.org/pod/CGI::Session
</a></li>
        <li><a     href="https://www.w3schools.com/SQL/deFault.asp">https://www.w3schools.com/SQL/deFault.asp</a></li>
        <li><a     href="https://javascript.info/">https://javascript.info/</a></li>
        <li><a 
href="https://www.devanddep.com/tutorial/perl/perl-reading-a-csv-file.html">https://www.devanddep.com/tutorial/perl/perl-reading-a-csv-file.html</a></li>   
    </ul>
</td>
</<tr>
<tr><td colspan="6">DOCENTES:
<ul>
<li>Richart Smith Escobedo Quispe - rescobedoq@unsa.edu.pe</li>
    <li>Carlo Jose Luis Corrales Delgado - ccorrales@unsa.edu.pe</li>
</ul>
</td>
<tr><td colspan="6">ESTUDIANTES:
<ul>
<li>Emmanuel David Hilacondo Begazo</li>
<li>German Arturo Chipana Jerónimo</li>
<li>Rodrigo Fabricio Layma Salas</li>
<li>Mauro Snayder Sullca Mamani</li>
</ul>
</td>
</<tr>
</tdbody>s
</table>

# Perl - Ajax - Session - DBI 

[![License][license]][license-file]
[![Downloads][downloads]][releases]
[![Last Commit][last-commit]][releases]

[![Debian][Debian]][debian-site]
[![Git][Git]][git-site]
[![GitHub][GitHub]][github-site]
[![Perl][Perl]][perl-site]
[![HTML][HTML]][html-site]
[![Bootstrap][Bootstrap]][bootstrap-site]
[![AJAX][AJAX]][ajax-site]
[![JAVASCRIPT][JavaScript]][javascript-site]
[![Mariadb][mariadb]][mariadb-site]

# 

## GENERADOR DE DIAGRAMAS UML
- Desarrollo de una aplicación web dinámica para la generación de diagramas UML a partir de archivos Java subidos desde GitHub, con funcionalidades de registro, inicio de sesión, comentarios y visualización de diagramas en formato SVG.


### Descripción
- El objetivo principal de este proyecto es diseñar y desarrollar una aplicación web interactiva que permita a los usuarios:

  - Registrarse e iniciar sesión con credenciales seguras, almacenadas en una base de datos.
  - Subir archivos Java directamente desde su repositorio de GitHub mediante integración automática basada en el nombre de usuario.
  - Procesar los archivos Java cargados para transformarlos en un archivo .puml que, a su vez, genera un diagrama UML en formato .svg.
  - Interactuar con una sección de comentarios donde los usuarios puedan dejar sugerencias y recomendaciones sobre el sistema o los diagramas generados.

### Equipos utilizados
-	Windows 11 Pro, versión 23H2
-	Visual Studio Code, versión 1.94.2
-	Docker Desktop v4.34
-	Lenguaje Perl
-	Lenguaje HTML 5
-	Lenguaje CSS
-	Lenguaje JavaScript
-	AJAX
-	SQL
-	Bootstrap
-	Git version 2.46.1
-	GitHub

### Objetivos

- Implementar un sistema de autenticación de usuarios con registro e inicio de sesión.
- Procesar archivos Java mediante integración con GitHub para generar diagramas UML en formato SVG.
- Desarrollar un sistema de comentarios para recibir retroalimentación de los usuarios.
- Aplicar sesiones y bases de datos para manejar la persistencia y seguridad de los datos de los usuarios.

### Temas
- Manejo de archivos Java
- Transformación de archivos a .puml
- Generación de diagramas UML en .svg
- HTML, Javascript y Bootstrap
- AJAX y manejo dinámico del cliente
- Perl y bases de datos
- Control de versiones con Git y GitHub


#
## SOLUCIÓN DEL EJERCICIO
El desarrollo del proyecto se organizó en tres componentes principales, cada uno cumpliendo un rol esencial para garantizar la funcionalidad y fluidez del sistema.
Cada parte esencial del código fue separado para después unirlo en el main del repositorio
Se testeo las posibles interacciones usuario - programa que se podría dar en la página web.
Al final se comprobó al unir el código que funcionaba de manera correcta la página web como se había previsto.
- **Frontend (HTML, Bootstrap, y AJAX)**
El frontend se diseñó para ofrecer una experiencia de usuario intuitiva y eficiente. A través de formularios web, los usuarios pueden:

  - Registrarse e iniciar sesión: Utilizando un diseño responsivo que facilita el acceso desde diferentes dispositivos.
  - Cargar archivos Java: Incluyendo la integración con GitHub para descargar automáticamente archivos desde repositorios del usuario.
  - Visualizar diagramas UML: Los diagramas generados se presentan en formato .svg de manera clara y accesible.
 
  Además, se implementaron dinámicamente interacciones con AJAX para mejorar la experiencia sin necesidad de recargar la página.
    
- **Backend (Perl y Bases de Datos)**
El backend desarrollado en Perl permitió manejar la lógica central del sistema, destacándose en los siguientes aspectos:

  - Conexión con GitHub: Se utilizó la API de GitHub para autenticar usuarios y descargar archivos Java automáticamente desde los repositorios indicados.
  - Procesamiento de archivos Java: Los archivos descargados fueron convertidos en scripts .puml para su posterior transformación en diagramas UML.
  - Gestión de sesiones y seguridad: Se manejaron variables de sesión para garantizar la persistencia de datos durante la interacción del usuario, incluyendo validación segura de credenciales almacenadas en la base de datos.

   La base de datos fue configurada para:

  - Almacenar credenciales de usuarios registrados de manera segura.
  - Llevar un historial de las operaciones realizadas por cada usuario, como la generación de diagramas UML.


- **Generación y Visualización de Diagramas UML**
El sistema procesó los archivos Java cargados y los transformó en diagramas UML visuales. Este proceso incluyó:

  - Conversión de código Java a archivos .puml utilizando scripts específicos.
  - Generación automática de diagramas UML en formato .svg listos para ser descargados o visualizados en la aplicación.
  

    
#
# PROGRAMA PRINCIPAL

## PERL

### register
```perl=6
use DBI;
use Digest::SHA qw(sha256_hex);
```
- DBI: Para interactuar con la base de datos.
- Digest::SHA: Para cifrar contraseñas utilizando SHA-256.

```perl=12
my $username = $cgi->param('username');
my $password = $cgi->param('password');
```
- $cgi->param: Recupera los datos del formulario enviados por el usuario, como el nombre de usuario (username) y la contraseña (password).

```perl=22
my $dsn = "DBI:mysql:database=puml_history;host=localhost;port=3306";
my $db_user = "root";
my $db_pass = "";
my $dbh = DBI->connect($dsn, $db_user, $db_pass, { RaiseError => 1, AutoCommit => 1 })
    or die "No se pudo conectar a la base de datos: $DBI::errstr";
```
- Configura la conexión a una base de datos MySQL llamada puml_history, en el host localhost y puerto 3306.
- DBI->connect: Establece la conexión con las credenciales del usuario root.

```perl=29
my $sth_check = $dbh->prepare("SELECT id, password FROM users WHERE username = ?");
$sth_check->execute($username);
my ($user_id, $stored_password) = $sth_check->fetchrow_array;
```
- Prepara y ejecuta una consulta SQL para verificar si el nombre de usuario ya está registrado.
- Recupera el ID del usuario y su contraseña cifrada si el usuario existe.

```perl=33
if ($user_id) {
    if (sha256_hex($password) eq $stored_password) {
        my $session = CGI::Session->new(undef, $cgi, { Directory => '/tmp/sessions' })
            or die CGI::Session->errstr;
        $session->param('username', $username);
        $session->param('user_id', $user_id);
        $session->expire('+1h');

        my $cookie = $cgi->cookie(CGISESSID => $session->id);
        print $cgi->redirect(-uri => '/general.html', -cookie => $cookie);
    } else {
        print $cgi->header(-type => 'text/html', -charset => 'UTF-8');
        print <<'HTML';
        <html>
        <head>
            <script type="text/javascript">
                alert("Contraseña incorrecta");
                window.location.href = "/index.html";  // Redirigir a index.html después del alert
            </script>
        </head>
        <body>
        </body>
        </html>
HTML
    }
```
- sha256_hex($password): Cifra la contraseña ingresada y la compara con la almacenada.
- Si coinciden:
  - Inicia sesión para el usuario.
- Si no coinciden:
  - Muestra un mensaje de alerta y redirige al usuario de nuevo al formulario.

```perl=63
my $hashed_password = sha256_hex($password);
my $sth_insert = $dbh->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
$sth_insert->execute($username, $hashed_password);

$user_id = $dbh->last_insert_id(undef, undef, "users", undef);
```
- Cifra la contraseña y registra al nuevo usuario en la base de datos.
- Obtiene el ID del nuevo usuario insertado.


```perl=71
my $session = CGI::Session->new(undef, $cgi, { Directory => '/tmp/sessions' })
    or die CGI::Session->errstr;
$session->param('username', $username);
$session->param('user_id', $user_id);
$session->expire('+1h');

my $cookie = $cgi->cookie(CGISESSID => $session->id);
print $cgi->redirect(-uri => '/general.html', -cookie => $cookie);
```
- Crea una sesión con el nombre de usuario y el ID recién registrado.
- Redirige al usuario a /general.html tras iniciar sesión.

---

### logout
```perl=5
use CGI::Session;
```
- use CGI::Session: Proporciona soporte para manejo de sesiones de usuario.

```perl=10
my $session = CGI::Session->new(undef, $cgi, { Directory => '/tmp/sessions' });
```
- CGI::Session->new: Carga o crea una sesión.
  - undef: Deja que el módulo determine automáticamente el ID de sesión.
  - $cgi: Asocia la sesión con los datos enviados por el cliente.
  - Directory => '/tmp/sessions': Especifica dónde se almacenarán los datos de sesión en el servidor.

```perl=13
$session->delete();
$session->flush();
```
- $session->delete(): Borra los datos asociados con la sesión en el servidor.
- $session->flush(): Garantiza que los cambios se guarden y la sesión finalice correctamente.

```perl=15
print $cgi->redirect('/index.html');
```
- $cgi->redirect('/index.html'): Redirige al usuario a la página index.html, una página de inicio o login.


---

### generate_uml
```perl=15
my $java_code_main        = $cgi->param('java_code_main');
my $java_code_inheritance = $cgi->param('java_code_inheritance');
my $java_code_interface   = $cgi->param('java_code_interface');
my $java_code_class       = $cgi->param('java_code_class');
my $java_comp_aggre       = $cgi->param('java_comp_aggre');
```
- El código obtiene el contenido de varias secciones de código Java enviadas. Estos parámetros se usarán para generar un archivo UML.

```perl=25
sub generate_uml_class {
```
Esta función analiza el código Java y genera representaciones UML para clases:

- Identifica clases, atributos, constructores y métodos.
- Usa prefijos para indicar visibilidad:
  - +para público, - para privado, # para protegido.
- Detecta palabras clave como static y final para incluir en el UML.
- Cierra la clase si es necesario.

```perl=149
sub generate_uml_interface {
```
Analiza las interfaces Java y genera representaciones UML:

- Captura atributos (siempre static) y métodos de la interfaz.
- Usa + para indicar métodos públicos.
- Identifica correctamente el cierre de la interfaz.

```perl=201
sub generate_uml_aggre_comp {
```
Genera relaciones UML de agregación y composición:

- Busca anotaciones específicas en el texto (@Agregación y @Composición).
- Asocia cardinalidades entre clases, como "1" o "*".

```perl=242
my $uml_content = '@startuml'."\n";
$uml_content .= generate_uml_class($java_code_inheritance) ."\n";
$uml_content .= generate_uml_interface($java_code_interface) ."\n";
$uml_content .= generate_uml_class($java_code_class) ."\n\n";
$uml_content .= generate_uml_class($java_code_main) ."\n";
$uml_content .= generate_uml_aggre_comp($java_comp_aggre) ."\n";
$uml_content .= "\n".'@enduml'."\n";
```
- Combina los UML generados de clases, interfaces y relaciones en un bloque PlantUML, marcando el inicio (@startuml) y el final (@enduml).

```perl=251
my $output_dir = "/usr/lib/puml_files/";
my $filename   = "archivo.puml";
my $filepath   = "$output_dir/$filename";

make_path($output_dir) unless -d $output_dir;

if (open(my $fh, '>', $filepath)) {
    print $fh $uml_content;
    close($fh);
}
```
- Guarda el archivo PlantUML (archivo.puml) en un directorio específico.
- Verifica que el directorio exista o lo crea si no está.

```perl=265
<p><strong>Contenido del archivo .puml:</strong></p>
<pre>$uml_content</pre>
<p><a type="submit" href="../puml_files/$filename" download class="btn btn-success">Descargar UML</a></p>
```
- Se muestra un mensaje de éxito con la opción de descargar el archivo UML.

```perl=286
my $script_path = 'fast_diagram.pl';


my $exit_status = system("perl $script_path");
```
- Llama a otro script (fast_diagram.pl) para continuar con el procesamiento, como generar diagramas UML basados en el archivo archivo.puml.

---

### save_puml
```perl=15
my $nombre = decode('UTF-8', param('NOMBRE') || '');
my $tipo_gestion = decode('UTF-8', param('TIPO_GESTION') || '');
my $estado_licenciamiento = decode('UTF-8', param('ESTADO_LICENCIAMIENTO') || '');
my $fecha_inicio_licenciamiento = decode('UTF-8', param('FECHA_INICIO') || ''); my $fecha_fin_licenciamiento = decode('UTF-8', param('FECHA_FIN') || '');
my $periodo_licenciamiento = decode('UTF-8', param('PERIODO_LICENCIAMIENTO') || '');
my $departamento = decode('UTF-8', param('DEPARTAMENTO') || '');
my $provincia = decode('UTF-8', param('PROVINCIA') || '');
my $distrito = decode('UTF-8', param('DISTRITO') || '');
```
- En este bloque del código de la línea 16 a la 24 recíbe los parámetros del index para poder realizar la búsqueda en el archivo CVS

---

### fetch_puml_history
```perl=7
use JSON;
```
- JSON: Se utiliza para enviar y recibir datos en formato JSON entre el servidor y el cliente.

```perl=19
my $action = $cgi->param('action') || '';
```
- El parámetro action recibido desde el frontend determina qué acción del CRUD se ejecutará.
- Las opciones son fetch, insert, delete, y update.


```perl=39
my $sth = $dbh->prepare("SELECT id, filename, content, created_at FROM files ORDER BY created_at DESC");
```
- Realiza una consulta SQL para obtener todos los registros de la tabla files.
- Los resultados se envían en formato JSON al frontend.

```perl=54
$dbh->do("INSERT INTO files (filename, content, created_at) VALUES (?, '', NOW())", undef, $filename);
```
- Inserta un nuevo registro en la tabla files. Solo requiere el nombre del archivo (filename); el contenido se inicializa vacío.

```perl=67
my $sth = $dbh->prepare("DELETE FROM files WHERE id = ?");
$sth->execute($id);
```
- Borra un registro específico utilizando su id como identificador.

```perl=86
my $sth = $dbh->prepare("UPDATE files SET content = ? WHERE id = ?");
$sth->execute($content, $id);
```
- Actualiza el contenido (content) de un archivo específico identificado por su id.

```perl=198
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
```
- La tabla se utiliza para mostrar los archivos obtenidos de la base de datos, con botones para editar o eliminar cada registro.
- Una ventana emergente permite editar el contenido de un archivo seleccionado.

---
     
### diagrama_uml
```perl=34
    my ($fecha) = @_;
    $fecha =~ s/-//g;
    return $fecha;
}
$fecha_inicio_licenciamiento = convertir_fecha_a_yyyymmdd($fecha_inicio_licenciamiento);
$fecha_fin_licenciamiento = convertir_fecha_a_yyyymmdd($fecha_fin_licenciamiento);  
```
- En la línea 35 se encuentra una función que cambiará la fecha recibida del HTML a un String usando expresiones regulares. En la línea 37 cada la expresión regular cada vez que encuentra un "-" lo elimina y después de todo este proceso la fecha es devuelta como un String. En la línea 42 y 43 mandamos las fechas a la función para que retornen sin los guiones.
 
# 
     
### fast_diagram_uml
```perl=7
my $puml_file = '../puml_files/archivo.puml';


my $javapuml_path = '../puml_files/plantuml.jar';


my $output_html = '../var/www/html/general.html';
```
- $puml_file: Es la ruta relativa del archivo .puml que contiene el código de diagrama que será procesado por PlantUML.
- $javapuml_path: Ruta al archivo .jar de PlantUML que se ejecutará para generar el diagrama.
- $output_html: Ruta donde se generará el archivo HTML con el mensaje de éxito o error.

```perl=7
my $puml_file = '../puml_files/archivo.puml';


my $javapuml_path = '../puml_files/plantuml.jar';


my $output_html = '../var/www/html/general.html';
```
- $puml_file: Es la ruta relativa del archivo .puml que contiene el código de diagrama que será procesado por PlantUML.
- $javapuml_path: Ruta al archivo .jar de PlantUML que se ejecutará para generar el diagrama.
- $output_html: Ruta donde se generará el archivo HTML con el mensaje de éxito o error.

```perl=16
unless (-e $puml_file) {
    escribir_html($output_html, { mensaje => "El archivo no se pudo generar." });
    die "El archivo $puml_file no existe.\n";
}
```
- -e: Verifica si el archivo .puml existe en la ruta especificada.
- Si el archivo no existe, se llama a la función escribir_html para generar un archivo HTML con el mensaje de error y luego termina la ejecución del script con die.

```perl=23
my $plantuml_command = "java -jar $javapuml_path -tsvg $puml_file -o ../puml_files";
```
- Este comando ejecuta el archivo .jar de PlantUML mediante Java, indicando que el archivo .puml debe ser procesado y que el resultado será un archivo SVG.
- -tsvg: Define el formato de salida como SVG.
- -o: Especifica el directorio de salida.

```perl=23
sub escribir_html {
    my ($ruta, $data) = @_;
    open my $fh, '>', $ruta or die "No se pudo abrir el archivo $ruta: $!\n";
    print $fh to_json($data, { pretty => 1 });
    close $fh;
}
```
- Esta función recibe una ruta de archivo (ruta) y un hash (data) con el mensaje.
- Abre el archivo HTML para escritura, convierte el hash a formato JSON utilizando to_json y escribe el contenido en el archivo.
- pretty => 1: Indica que el JSON debe ser formateado de manera legible (con saltos de línea y sangrías).


```perl=23
my $plantuml_command = "java -jar $javapuml_path -tsvg $puml_file -o ../puml_files";
```
- Este comando ejecuta el archivo .jar de PlantUML mediante Java, indicando que el archivo .puml debe ser procesado y que el resultado será un archivo SVG.
- -tsvg: Define el formato de salida como SVG.
- -o: Especifica el directorio de salida.

# 
     


## HTML

### index
```html=5
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Generador de Diagramas UML</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto...&display=swap" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/main.css" rel="stylesheet">
```
- <meta charset="utf-8">: Define la codificación de caracteres del documento.
- <meta name="viewport">: Hace que el sitio sea responsivo, ajustando el diseño a diferentes tamaños de pantalla.
Fuentes y CSS: Se incluyen enlaces a fuentes de Google (Roboto, Poppins) y varios archivos CSS, incluidos Bootstrap y estilos personalizados de la página (main.css).

```html=35
<section id="hero" class="hero section dark-background">
  <img src="assets/img/hero-bg.jpg" alt="" data-aos="fade-in">
  <div class="container text-center" data-aos="fade-up" data-aos-delay="100">
    <div class="row justify-content-center">
      <div class="col-lg-6">
        <h2>Inicia Sesión o Registrate</h2>
        <p>Crea o accede a tu cuenta para empezar a generar diagramas UML.</p>
        <form action="../cgi-bin/register.pl" method="post" class="php-auth-form">
          <div class="row gy-3">
            <div class="col-12">
              <input type="text" name="username" class="form-control" placeholder="Nombre de Usuario" required>
            </div>
            <div class="col-12">
              <input type="password" name="password" class="form-control" placeholder="Contraseña" required>
            </div>
            <div class="col-12">
              <button type="submit" class="btn btn-primary w-100">Continuar</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
```
- Sección Hero: Esta es la sección principal de la página donde se muestra el formulario de inicio de sesión o registro.
  - Imagen de fondo: hero-bg.jpg que se carga con un efecto de entrada.
  - Formulario: Un formulario HTML que envía los datos a un script CGI (register) usando el método POST.
    - Campos de entrada para el nombre de usuario y contraseña.
    - Botón de envío que permite continuar al siguiente paso después de completar el formulario.

```html=74
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="assets/js/main.js"></script>
<script>   
  const loginForm = document.getElementById('login-form');
  
  loginForm.addEventListener('submit', function(event) {
    event.preventDefault();
    window.location.href = 'general.html';
  });
</script>
```
- Scripts: Estos scripts se encargan de la funcionalidad dinámica de la página.
  - Bootstrap y otros plugins: Se cargan para habilitar efectos visuales y funciones interactivas como los modales, desplazamiento suave, etc.
  - Evento submit: Un script adicional que redirige al usuario a general.html cuando el formulario es enviado, aunque parece que este script no está asociado a ningún formulario en el HTML mostrado.

# 

### general 

```html=178
<div id="myModal" class="modal">
    <div class="modal-content">
        <p>Ingresar agregación y composición de la siguiente manera:</p>
        <p>
            @Agregacion: (nombre de la clase) (cantidad) tiene (nombre de la clase) (cantidad)<br>
            @Composicion: (nombre de la clase) (cantidad) tiene (nombre de la clase) (cantidad)<br>
            Ejemplo:<br>
            @Agregacion: Concesionario 1 tiene Agregacion 0...<br>
            @Composicion: Concesionario 1...n* tiene Composicion 2..5
        </p>
    </div>
</div>
```
- La sección del código relacionada con la ventana modal proporciona información sobre cómo ingresar detalles de agregación y composición en el código Java.

```perl=248
loadReposButton.addEventListener('click', () => {
    const username = usernameInput.value;
    if (!username) {
        alert('Por favor ingresa tu nombre de usuario de GitHub');
        return;
    }

    fetch(`${apiUrl}/users/${username}/repos?type=all`)
        .then(response => response.json())
        .then(data => {
            repoSelect.innerHTML = '<option value="">Selecciona un repositorio</option>';
            if (data.length > 0) {
                data.forEach(repo => {
                    const option = document.createElement('option');
                    option.value = repo.name;
                    option.textContent = repo.name;
                    repoSelect.appendChild(option);
                });
                repoSelect.disabled = false;
            } else {
                alert('No se encontraron repositorios para este usuario.');
            }
        })
        .catch(error => alert('Error al cargar repositorios: ' + error));
});
```
- El JavaScript maneja la carga de repositorios de GitHub usando la API de GitHub. También permite que el usuario seleccione archivos .java de un repositorio específico.

```perl=306
 loadFileButton.addEventListener('click', () => {
            const fileUrl = fileSelect.value;
            if (!fileUrl) {
                alert('Por favor selecciona un archivo para cargar.');
                return;
            }

            if (!selectedInput) {
                alert('Por favor selecciona un campo de texto donde cargar el archivo.');
                return;
            }

            fetch(fileUrl)
                .then(response => response.text())
                .then(content => {
                    selectedInput.value += '\n' + content;
                })
                .catch(error => alert('Error al cargar el contenido del archivo: ' + error));
});
```
- Después de que el usuario selecciona un archivo .java, el contenido del archivo se carga en el área de texto correspondiente del formulario.

```perl=327
const chatIcon = document.getElementById('chat-icon');
const chatWindow = document.getElementById('chat-window');

chatIcon.addEventListener('click', () => {
    chatWindow.style.display = chatWindow.style.display === 'flex' ? 'none' : 'flex';
});

formulario.addEventListener('submit', (e) => {
    e.preventDefault();
    const mensajeUsuario = entrada.value.trim();
    if (mensajeUsuario) {
        agregarMensaje('usuario', mensajeUsuario);
        entrada.value = '';
        mostrarNotificacion();
    }
});

function agregarMensaje(clase, texto) {
    const mensaje = document.createElement('div');
    mensaje.className = `mensaje ${clase}`;
    mensaje.innerHTML = `<p>${texto}</p>`;
    mensajesDiv.appendChild(mensaje);
    mensajesDiv.scrollTop = mensajesDiv.scrollHeight; 
}
```
- Esta sección implementa un icono flotante que permite abrir y cerrar una ventana de chat para enviar mensajes al usuario. El chat se maneja con un formulario simple.


```perl=395
document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelector('.php-code-form');
    const umlImageContainer = document.getElementById('imagen-uml');

    form.addEventListener('submit', async (event) => {
        event.preventDefault();
        const formData = new FormData(form);

        try {
            // Enviar los datos al script Perl
            const response = await fetch('/cgi-bin/generate_uml.pl', {
                method: 'POST',
                body: formData            });

            if (response.ok) {
                form.reset();
                const svgResponse = await fetch("../puml_files/archivo.svg");

                if (svgResponse.ok) {
                    const svgText = await svgResponse.text();
                    umlImageContainer.innerHTML = svgText;
                } else {
                    console.error('Error al obtener el archivo SVG:', svgResponse.statusText);
                }
            } else {
                console.error('Error en la solicitud:', response.statusText);
            }
        } catch (error) {
            console.error('Error al enviar los datos:', error);
        }
    });
});
```
- El formulario envía los datos al script Perl /cgi-bin/generate_uml.pl, que procesa los datos y genera el diagrama UML. La imagen resultante (en formato SVG) se inserta en el contenedor correspondiente.




#

## BASE DE DATOS
### init_db
```sql=6
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
La tabla users está diseñada para almacenar información de los usuarios registrados en el sistema. Esta tabla tiene los siguientes campos:

- id: Un identificador único para cada usuario. Es un entero que se auto-incrementa y se utiliza como clave primaria.
- username: El nombre de usuario del usuario, de tipo VARCHAR(255), que debe ser único.
- password: La contraseña del usuario, también de tipo VARCHAR(255).
- created_at: La fecha y hora en que se creó el usuario. Este campo tiene un valor predeterminado de la hora actual, lo que significa que se llena automáticamente al crear el registro.

```sql=6
CREATE TABLE IF NOT EXISTS files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    filename VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```
La tabla files está diseñada para almacenar los archivos PUML cargados por los usuarios. Sus campos son:

- id: Un identificador único para cada archivo, de tipo entero que se auto-incrementa y es clave primaria.
- filename: El nombre del archivo PUML, de tipo VARCHAR(255).
- content: El contenido del archivo PUML, almacenado como texto (TEXT), lo que permite guardar archivos grandes.
- user_id: Este campo relaciona cada archivo con un usuario, utilizando la clave foránea que hace referencia al id de la tabla users.
- created_at: La fecha y hora en que el archivo fue cargado. También tiene un valor predeterminado de la hora actual.


Además, se establece una relación de clave foránea entre el campo user_id de la tabla files y el campo id de la tabla users, lo que permite asociar cada archivo con el usuario que lo subió.

### Diagrama de la base de datos usada
![image](https://hackmd.io/_uploads/Hyl6bzAE1e.png)


# 
## EXPLICACIÓN DEL USO DE AJAX PARA CRUD
### Create
- La operación "Crear" se utiliza para insertar nuevos registros en la base de datos. En este caso, se envían los datos del nombre del archivo desde un formulario a través de AJAX.
```javascript=242
$('#add-form').on('submit', function(e) {
    e.preventDefault();
    const filename = $('#filename').val();
    $.post('', { action: 'insert', filename: filename }, function(response) {
        alert(response.message);
        fetchRecords();
        $('#filename').val('');
    }, 'json');
});
```
- En este fragmento, el formulario se envía mediante AJAX para crear un nuevo archivo en la base de datos.
- Después de la inserción, la lista de archivos se recarga automáticamente con fetchRecords().

### Read
- La operación "Leer" se utiliza para obtener registros desde la base de datos. Se realiza una solicitud POST con la acción fetch para obtener los datos y mostrarlos en la interfaz de usuario.

```javascript=217
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
                            <button class="edit-btn" data-id="${record.id}" data-content="${record.content}">
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
```
- La función fetchRecords() envía una solicitud para obtener todos los registros de la base de datos.
- Luego, la tabla HTML se actualiza con los datos obtenidos.

### Update
- La operación "Actualizar" permite modificar registros existentes. En este caso, se actualiza el contenido de un archivo, enviando los nuevos datos mediante una solicitud POST con la acción update.

```javascript=259
$('#save-btn').on('click', function() {
    const id = $('#edit-modal').data('id');
    const content = $('#edit-content').val();
    $.post('', { action: 'update', id: id, content: content }, function(response) {
        alert(response.message);
        $('#edit-modal').fadeOut();
        fetchRecords();
    }, 'json');
});
```
- Al guardar, los datos del archivo se actualizan en la base de datos y la lista se recarga para reflejar los cambios.

### Delete
- La operación "Eliminar" permite borrar registros. Se envía una solicitud POST al servidor con la acción delete para eliminar el archivo.

```javascript=273
$(document).on('click', '.delete-btn', function() {
    const id = $(this).data('id');
    if (confirm('¿Seguro que deseas eliminar este archivo?')) {
        $.post('', { action: 'delete', id: id }, function(response) {
            alert(response.message);
            fetchRecords();
        }, 'json');
    }
});
```
- La confirmación de eliminación se realiza mediante confirm(), y si el usuario acepta, se envía la solicitud para eliminar el archivo y se recarga la lista de archivos.


# 
## EXPLICACIÓN DEL USO DE VARIABLES DE SESIÓN
### Explicación
- El uso de variables de sesión en el registo de usuario facilita la autenticación y la personalización del flujo de trabajo de la aplicación, permitiendo que los usuarios puedan interactuar con la aplicación de manera eficiente y segura. Al almacenar información crítica del usuario en la sesión, se asegura que el sistema pueda gestionar correctamente los permisos y el acceso a los datos del usuario mientras se mantiene la seguridad.

#
## DOCKERFILE
### Explicación
```dockerfile
FROM bitnami/minideb
ENV DEBIAN_FRONTEND="noninteractive"
```
- Usa una imagen ligera basada en Debian.
- Configura el entorno para evitar prompts interactivos durante la instalación.
```dockerfile
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apache2 \
        perl \
        libcgi-pm-perl \
        mariadb-server \
        mariadb-client \
        libdbd-mysql-perl \
        libjson-perl \
        libcgi-session-perl \
        default-jre-headless \
        graphviz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
```
- Actualiza el índice de paquetes (apt-get update) e instala:
  - Apache2: Servidor web.
  - Perl y módulos (libcgi-pm-perl, libdbd-mysql-perl, libjson-perl, libcgi-session-perl): Soporte para scripts CGI y manejo de sesiones, JSON, y conexiones a bases de datos.
  - MariaDB Server y Client: Base de datos y cliente.
  - Java Runtime Environment (JRE): Necesario para PlantUML.
  - Graphviz: Generador de gráficos para PlantUML.
- apt-get clean & rm: Limpia archivos innecesarios para reducir el tamaño de la imagen.
```dockerfile
RUN a2enmod cgid

RUN mkdir -p /usr/lib/cgi-bin /usr/lib/puml_files /var/www/html /var/lib/mysql /run/mysqld /tmp/sessions && \
    chown -R mysql:mysql /var/lib/mysql /run/mysqld && \
    chmod -R 755 /usr/lib/cgi-bin && \
    chmod -R 755 /var/www/html && \
    chown -R www-data:www-data /usr/lib/puml_files && \
    chmod -R 755 /usr/lib/puml_files && \
    chmod -R 777 /tmp/sessions
```
- a2enmod cgid: Habilita el módulo CGI de Apache para ejecutar scripts CGI.
- mkdir: Crea directorios necesarios:
  - /usr/lib/cgi-bin: Para los scripts CGI.
  - /usr/lib/puml_files: Para PlantUML.
  - /var/www/html: Para archivos web.
  - /var/lib/mysql, /run/mysqld: Para MariaDB.
  - /tmp/sessions: Para sesiones temporales.
- chmod y chown: Ajusta permisos y propietarios para garantizar que los servicios funcionen correctamente.
```dockerfile
RUN ln -s /usr/lib/puml_files /var/www/html/puml_files
```
- Crea un enlace simbólico desde /usr/lib/puml_files hacia /var/www/html/puml_files para exponer los archivos de PlantUML en el servidor web.
```dockerfile
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql
```
- mariadb-install-db: Inicializa la base de datos MariaDB.
- chown: Ajusta los permisos de MariaDB al usuario mysql.
```dockerfile
COPY ./cgi-bin/ /usr/lib/cgi-bin/
COPY ./html/ /var/www/html/
COPY ./puml_files/ /usr/lib/puml_files/
COPY ./plantuml.jar /usr/lib/puml_files/plantuml.jar
COPY ./init_db.sql /docker-entrypoint-initdb.d/
```
- Copia los archivos necesarios al contenedor:
  - cgi-bin/: Scripts CGI.
  - html/: Archivos HTML del servidor web.
  - puml_files/ y plantuml.jar: Archivos relacionados con PlantUML.
  - init_db.sql: Script SQL para inicializar la base de datos.
```dockerfile
RUN chmod 644 /docker-entrypoint-initdb.d/init_db.sql && \
    chown mysql:mysql /docker-entrypoint-initdb.d/init_db.sql

RUN chmod +x /usr/lib/cgi-bin/*.pl && \
    chmod +x /usr/lib/puml_files/plantuml.jar
```
- chmod:
  - Asegura que el script de inicialización SQL tenga permisos de lectura.
  - Hace ejecutables los scripts CGI (*.pl) y PlantUML (plantuml.jar).
```dockerfile
CMD ["/bin/bash", "-c", "mysqld --datadir=/var/lib/mysql --user=mysql --skip-grant-tables & sleep 5 && mysql < /docker-entrypoint-initdb.d/init_db.sql && apachectl -D FOREGROUND"]
```
- Comando principal que:
  - Inicia MariaDB en modo sin autenticación (--skip-grant-tables).
  - Ejecuta el script SQL de inicialización (init_db.sql).
  - Inicia Apache en primer plano (apachectl -D FOREGROUND).
```dockerfile
EXPOSE 80
```
- ![WhatsApp Image 2024-12-16 at 3.52.49 PM](https://hackmd.io/_uploads/BykP7f04yx.jpg)
Expone el puerto 80 para permitir que el servidor web sea accesible.

### Comandos
- Copiar este comando para crear la imagen.
```sh
docker build -t img .
```
- Copiar este comando para crear el contenerdor.
```sh
docker run -d --name pweb1 -p 8089:80 img
```
- Acceder a base de datos
```sh
Docker exec -it pweb1 bash

mysql -u root -p
use puml_history;
select * from users;
select * from files;
```
#  
## COMMITS MÁS IMPORTANTES
Antes de iniciar el proyecto habíamos decidido que trabajaríamos con ramas, por eso algunos commits aparecerán con nombres de rama diferentes a `main`.
#### Commit "HTML, CSS, AJAX en el index y la ventana general de nuestra web" 
![Commit5]
- En estos commits añadimos los campos de texto para que el usuario pueda ingresar sus codigos y ademas de poder conectar el form con el perl que genera el archivo.pl.
#### Commit "Logica generacion de diagrama UML"
![image](https://hackmd.io/_uploads/SkbaQGANyl.png)
- Este commit fue una actualizacion que servirìa a futuro en la logica de la generacion del diagrama UML. 
#### Commit "Creacion del archivo generate_uml.pl"
![Commit1]
- Este commit se encargará de generar el diagrama código puml para que después pueda generarse la imágen .svg  y se pueda mostrar en el diagrama al usuario de la página.

#### Commit del historial y crud completo
![image](https://hackmd.io/_uploads/SkYiMf041e.png)
- Con este commit habíamos completado ya la parte de CRUD con ajax, permitiendo actualizar, eliminar, crear archivos dentro de la base de datos.

#### Commit de logica para generar el diagrama.svg
![image](https://hackmd.io/_uploads/Syg8EzRN1e.png)
- Este commit sirvio para generar la logica para la generacion de archivo.svg en la cual estara el diagrama UML.

#
## EXPLICACIÓN DE CAPTURAS

![image](https://hackmd.io/_uploads/HyAqSzCVJx.png)

- Esta es la parte donde el usuario debe registrarse o iniciar sesion con su cuenta.

![image](https://hackmd.io/_uploads/Skg2SfA41l.png)

- Esta es la ventana principal de nuestra web donde el usuario puede empezar a generar diagramas UML.

![image](https://hackmd.io/_uploads/H1q2HzANJg.png)

- En esta parte el usuario puede conectar su cuenta de GitHub con la pagina para poder obtener archivos que son de lenguaje java, los cuales se insertaran en los campos  de texto que estan abajo.

![image](https://hackmd.io/_uploads/B1carMRVyg.png)

- En esta parte se observa los campos de texto donde el usuario puede ingresar de manera manual sus codigos java o insertarlos de su GitHub.

![image](https://hackmd.io/_uploads/S190BG0Eyx.png)

- Al dar en el boton de generar UML, me genera el diagrama UML.

![image](https://hackmd.io/_uploads/SJwVLzRN1e.png)


- Al dar en el boton de guardar, el usuario debe de ingresar el nombre del archivo con el cual se guardara en el historial.



#
## INFORMACIÓN RECOPILADA

Para el desarrollo de la aplicación web interactiva que permite la generación de diagramas UML a partir de archivos .java descargados desde GitHub, se han recopilado datos relevantes de diversas fuentes para comprender mejor el contexto, las herramientas y las técnicas necesarias. Estas son:

#### 1. Generación de Diagramas UML 
El proceso de generar diagramas UML a partir de código Java se realiza transformando el código en formato .puml, que luego se utiliza para generar el diagrama visual. El lenguaje PlantUML es utilizado ampliamente para este propósito, proporcionando una forma sencilla y efectiva de representar estructuras de código en diagramas UML.

- Referencia de la herramienta PlantUML: 
https://plantuml.com/

#### 2. Conexión con la API de GitHub 
La aplicación utiliza la API de GitHub para autenticar a los usuarios y descargar automáticamente archivos .java de sus repositorios. Esto permite integrar el código fuente directamente desde GitHub sin necesidad de intervención manual.
- Consultado en la documentación oficial de GitHub API: https://docs.github.com/en/rest

#### 3. Uso de Perl para la Lectura de Archivos y Generación de Archivos .puml 
Perl se utiliza para interactuar con los archivos Java, leer su contenido y generar archivos .puml que representan la estructura de clases y métodos en el código. Perl es especialmente adecuado para esta tarea debido a su capacidad para manejar grandes cantidades de datos de manera eficiente y su soporte para expresiones regulares, lo que facilita el análisis del código Java.

- Consultado en: 
https://perldoc.perl.org/perlre.html

#### 4. Generación de Diagramas UML con Graphviz
Para representar los diagramas UML, la aplicación utiliza Graphviz, una herramienta de visualización de gráficos que permite generar representaciones gráficas a partir de descripciones textuales. El formato .puml generado a partir del código Java se convierte en diagramas visuales utilizando Graphviz, que convierte automáticamente las relaciones entre clases y métodos en un diagrama UML.

- Referencia de Graphviz: 
https://graphviz.gitlab.io/

# 
## CONCLUSIONES
### Integración Exitosa de Tecnologías
El proyecto logró integrar varias tecnologías clave, como Perl, AJAX, Bootstrap, PlantUML y Docker, para crear una aplicación web interactiva y eficiente. El uso de Perl permitió gestionar el backend, mientras que AJAX y Bootstrap garantizaron una experiencia fluida para el usuario. PlantUML se utilizó para convertir los archivos Java en diagramas UML visuales y Docker facilitó la creación de un entorno consistente para el desarrollo y despliegue.

### Interfaz Amigable y Funcional
Se diseñó una interfaz de usuario dinámica, adaptativa y fácil de usar. Gracias a Bootstrap, la aplicación es responsiva y se ajusta a diferentes tamaños de pantalla. AJAX permitió la comunicación con el servidor sin recargar la página, lo que mejoró la interacción del usuario. Además, los formularios de registro e inicio de sesión fueron sencillos de utilizar, y la carga de archivos Java desde GitHub fue fluida y rápida.

### Despliegue Eficiente con Docker
El uso de Docker fue fundamental para garantizar que la aplicación pudiera ser desplegada de manera rápida y consistente en cualquier entorno compatible. La configuración de contenedores con Apache, Perl, y MariaDB permitió ejecutar el proyecto de manera eficiente. Además, la creación de un contenedor específico para la aplicación facilitó la gestión de dependencias y la configuración del entorno, asegurando que el proyecto funcionara sin problemas tanto en desarrollo como en producción.

# 
## RECOMENDACIONES
### Ampliar la Compatibilidad con Otros Lenguajes de Programación
Actualmente, el sistema está enfocado en archivos Java, pero sería beneficioso ampliar la funcionalidad para incluir otros lenguajes de programación, como Python o C++, lo que permitiría a más usuarios aprovechar la herramienta.

### Optimizar el Proceso de Generación de Diagramas
El proceso de conversión de archivos a diagramas UML puede ser más rápido si se implementan técnicas para manejar archivos más grandes de forma más eficiente.

### Ampliar las Funcionalidades de Retroalimentación
Mejorar la sección de comentarios para permitir una interacción más dinámica entre los usuarios, como incluir una opción para valorar los diagramas generados o realizar preguntas frecuentes.




# 
## RUBRICA
| ITEM | DESCRIPCION | EXCELENTE | PROCESO | DEFICIENTE |
|-----------|-----------|-----------|-----------|-----------|
|Código fuente|Hay porciones de código fuente importantes con numeración y explicaciones detalladas de sus funciones.|  X    |     |     |
|Ejecución|Se incluyen ejecuciones/pruebas del código fuente explicadas gradualmente hasta llegar al código final del requerimiento del laboratorio.|  X   |     |     |
|Pregunta|Se responde con completitud a la pregunta formulada en la tarea. (El profesor puede preguntar para refrendar calificación). Si no se le entrego pregunta, usted recopile información relevante para el laboratorio desde diferentes medios, referenciándola correctamente.|   X  |     |     |
|Ortografía|El documento no muestra errores ortográficos.|   X  |     |     |
|Madurez|El Informe muestra de manera general una evolución de la madurez del código fuente, explicaciones puntuales pero precisas y un acabado impecable. (El profesor puede preguntar para refrendar calificación).|     |   X  |     |
|     |CALIFICACION|  18   |  2   |     |
#
## REFERENCIAS

- Documentación de Git
https://git-scm.com/book/es/v2

- Guías de GitHub
https://guides.github.com/

- Tutorial de Perl en GeeksforGeeks
https://www.geeksforgeeks.org/perl-tutorial-learn-perl-with-examples/

- Tutorial de Expresiones Regulares en Perl
https://www.blyx.com/public/docs/expresiones_regulares_perl.html

- Documentación Oficial de MariaDB
https://mariadb.org/

- Generación de Diagramas UML desde Archivos de Código (para la generación de diagramas UML a partir de archivos .puml)
https://plantuml.com/ 

- Perl Introduction, FireShip 
https://www.youtube.com/watch?v=74_7LrRe5DI&t=8s

#

[license]: https://img.shields.io/github/license/rescobedoq/pw2?label=rescobedoq
[license-file]: https://github.com/rescobedoq/pw2/blob/main/LICENSE

[downloads]: https://img.shields.io/github/downloads/rescobedoq/pw2/total?label=Downloads
[releases]: https://github.com/rescobedoq/pw2/releases/

[last-commit]: https://img.shields.io/github/last-commit/rescobedoq/pw2?label=Last%20Commit

[Debian]: https://img.shields.io/badge/Debian-D70A53?style=for-the-badge&logo=debian&logoColor=white
[debian-site]: https://www.debian.org/index.es.html

[Git]: https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white
[git-site]: https://git-scm.com/

[GitHub]: https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white
[github-site]: https://github.com/

[Perl]: https://img.shields.io/badge/perl-%2339457E.svg?style=for-the-badge&logo=perl&logoColor=white
[perl-site]: https://www.perl.org/

[HTML]: https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white
[html-site]: https://developer.mozilla.org/en-US/docs/Web/HTML

[Bootstrap]: https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white
[bootstrap-site]: https://getbootstrap.com/

[Debian]: https://img.shields.io/badge/debian-%23A80030.svg?style=for-the-badge&logo=debian&logoColor=white
[debian-site]: https://www.debian.org/

[AJAX]: https://img.shields.io/badge/ajax-%230000FF.svg?style=for-the-badge&logo=javascript&logoColor=white
[ajax-site]: https://developer.mozilla.org/en-US/docs/Web/Guide/AJAX

[JAVASCRIPT]: https://img.shields.io/badge/javascript-%23F7DF1E.svg?style=for-the-badge&logo=javascript&logoColor=black
[javascript-site]: https://developer.mozilla.org/en-US/docs/Web/JavaScript

[Mariadb]: https://img.shields.io/badge/mariadb-%23007A8C.svg?style=for-the-badge&logo=mariadb&logoColor=white
[mariadb-site]: https://mariadb.org/

[CVS]: https://drive.google.com/file/d/1hQV-FiOyOfhyFOjosfse_tL4TTONwiwu/view

[CSS_COMP]: https://hackmd.io/_uploads/H1-XeSdfkg.jpg
[HTML_COMP]: https://hackmd.io/_uploads/S1brgB_f1l.jpg


[Prueba1]:https://hackmd.io/_uploads/HJ6xM4uzyg.jpg
[Prueba2]:https://hackmd.io/_uploads/HkFU7NOzkl.jpg
[Prueba3]:https://hackmd.io/_uploads/SyMm4Euzyg.jpg
[Prueba4]:https://hackmd.io/_uploads/Bk7KV4_fkx.jpg
[Prueba5]:https://hackmd.io/_uploads/BJwBB4OGye.jpg
[Prueba6]:https://hackmd.io/_uploads/HkQ3SE_M1x.jpg
[Prueba7]:https://hackmd.io/_uploads/HkpJ8VOfJl.jpg

[Commit1]:https://hackmd.io/_uploads/r13Wbz0Nkg.jpg
[Commit2]:
[Commit3]:https://hackmd.io/_uploads/ryAoc4_M1x.jpg
[Commit4]:https://hackmd.io/_uploads/SJId2EdfJx.jpg
[Commit5]:https://hackmd.io/_uploads/HJj2-fA4yg.jpg


[![Debian][Debian]][debian-site]
[![Git][Git]][git-site]
[![GitHub][GitHub]][github-site]
[![Perl][Perl]][perl-site]
[![HTML][HTML]][html-site]
[![Bootstrap][Bootstrap]][bootstrap-site]
[![AJAX][AJAX]][ajax-site]
[![JAVASCRIPT][JavaScript]][javascript-site]
[![Mariadb][mariadb]][mariadb-site]

[![License][license]][license-file]
[![Downloads][downloads]][releases]
[![Last Commit][last-commit]][releases]