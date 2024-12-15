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

### echo
```perl=15
  # Leer los parámetros del formulario HTML, decodificando en UTF-8
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

### logout
```perl=15
  # Leer los parámetros del formulario HTML, decodificando en UTF-8
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

### registro
```perl=15
  # Leer los parámetros del formulario HTML, decodificando en UTF-8
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

### generate_uml
```perl=15
  # Leer los parámetros del formulario HTML, decodificando en UTF-8
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

### save_puml
```perl=15
  # Leer los parámetros del formulario HTML, decodificando en UTF-8
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
```perl=26
 # Configura Text::CSV para archivos CSV con comas y UTF-8
 my $csv = Text::CSV->new({ sep_char => ",", binary => 1, auto_diag => 1 });
 # Abre el archivo CSV en modo UTF-8
 open(my $fh, '<:encoding(UTF-8)', 'Data_Universidades_LAB06.csv') or die "No se pudo abrir el archivo: $!";

 # Omitir la primera línea (cabecera)
 my $header = $csv->getline($fh);
```
- En la línea 27 se procede a abrir el archivo CVS de las univeridades, nuestro archivo CVS esta divido por comas por eso indicamos a perl que el separador serán las comas, lo siguiente hace que perl haga una búsqueda binaria lo que facilita al momento en el que halla salto de líneas y la última indicación lanza errores cuando algo sale mal al momento de leer el archivo.
- En la línea 29 se abre el archivo con los estándares UTF - 8 para que acepte las tildes del archivo CVS, en caso haya un error lanza el mensaje de "No se pudo abiri el archivo" y devuelve el error.
- En la línea 32 recibe la primera fila, lo que permite analizar solo el contenido que nos interesa y para más tarde imprimirlo en el HTML

---
     
### diagrama_uml
```perl=34
   # Función para convertir las fechas de yyyy-MM-dd a yyyyMMdd
sub convertir_fecha_a_yyyymmdd {
    my ($fecha) = @_;
    $fecha =~ s/-//g;
    return $fecha;
}

# Convertir fechas de búsqueda a yyyyMMdd
$fecha_inicio_licenciamiento = convertir_fecha_a_yyyymmdd($fecha_inicio_licenciamiento);
$fecha_fin_licenciamiento = convertir_fecha_a_yyyymmdd($fecha_fin_licenciamiento);  
```
- En la línea 35 se encuentra una función que cambiará la fecha recibida del HTML a un String usando expresiones regulares. En la línea 37 cada la expresión regular cada vez que encuentra un "-" lo elimina y después de todo este proceso la fecha es devuelta como un String. En la línea 42 y 43 mandamos las fechas a la función para que retornen sin los guiones.
 
# 
     
### session_check
```perl=45 
while (my $row = $csv->getline($fh)) {
    # Extraer los campos directamente, ya en UTF-8
    my ($codigo, $nombre_u, $tipo, $estado, $inicio, $fin, $periodo, $dpto, $prov, $dist, $ubigeo, $latitud, $longitud, $fecha_corte) = @$row;

    # Aplicamos filtros según los parámetros ingresados por el usuario en el formulario HTML
    if (($nombre_u =~ /\Q$nombre\E/i) && 
        ($tipo_gestion eq '' || $tipo =~ /\Q$tipo_gestion\E/i) &&   
        ($estado_licenciamiento eq '' || $estado =~ /\Q$estado_licenciamiento\E/i) && 
        ($fecha_inicio_licenciamiento eq '' || $inicio =~ /\Q$fecha_inicio_licenciamiento\E/i) && 
        ($fecha_fin_licenciamiento eq '' || $fin =~ /\Q$fecha_fin_licenciamiento\E/i) &&
        ($periodo_licenciamiento eq '' || $periodo =~ /\Q$periodo_licenciamiento\E/i) &&  
        ($departamento eq '' || $dpto =~ /\Q$departamento\E/i) &&   
        ($provincia eq '' || $prov =~ /\Q$provincia\E/i) &&       
        ($distrito eq '' || $dist =~ /\Q$distrito\E/i)) {

        # Si todos los filtros coinciden, agrega la fila actual (@$row) al arreglo @universidades
        push(@universidades, $row);
    }
}
close $fh;     
```
- En la línea 45 se abre un bucle para que revise cada fila del archivo CVS, después la variable $row guarda la referencia de un arreglo que contiene los valores de la fila actual y en la línea 47 desreferencia la referencia al arreglo y lo divide cada valor de la lista en una variable.



- En la línea 50 se abre un condiconal que verifica con expresiones regulares si el valor es el correspondiente a lo buscado por el usuario o en caso no busque nada podra pasar de manera correcta. 
  
<details>
     
<summary>Explicación de las expresiones regulares</summary>
<pre>
La expresión regular revisa si la variable es la misma buscada en el parámetro
enviada por el formulario HTML.(/\Q$departamento\E/i) en esta expresión la Q se
escapa automáticamente todos los caracteres especiales dentro del patrón, de 
modo que se traten literalmente y no como operadores de expresiones regulares.
La E cierra la Q y la i se encargá  de no hacer sensible a mayúsculas 0
minúsculas cuando se esta comparando.
</pre>
     
</details>
     
- En la línea 61 si todos los parámetros son correctos se guardará en el arreglo de universidades y en la 64 cierra el archivo CVS para evitar inconvenientes en lo que sigue de código
# 
     


## HTML

### index
![HTML_COMP]
```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles.css">
    <title>Universidades Peruanas</title>
</head>
```
- Esta sección establece la configuración básica de un documento HTML. Declara que es HTML5, define el idioma como español, y especifica la codificación UTF-8 para soportar caracteres especiales. Incluye metadatos para que la página sea responsive, enlaza un archivo de estilos externo `(styles.css)` para aplicar diseño, y establece el título "Universidades Peruanas", que aparece en la pestaña del navegador.
# 

### general 
```html
<body>
    <form class="formulario" action="/cgi-bin/buscarDatosUniversidades.pl" method="get">
```
- Esta parte representa el inicio del cuerpo de la página y un formulario que permite al usuario enviar datos. El formulario tiene la clase `formulario` y envía los datos al script CGI `buscarDatosUniversidades.pl` en el servidor. El atributo `method="get"` indica que los datos se enviarán como parámetros en la URL, lo que es útil para solicitudes donde los datos no son sensibles y pueden ser visibles en la barra de direcciones.


#

## BASE DE DATOS
### init_db
```sql
FROM bitnami/minideb
ENV DEBIAN_FRONTEND="noninteractive"
```
- Usa una imagen ligera basada en Debian.



# 
## EXPLICACIÓN DEL USO DE AJAX PARA CRUD
### Create
-
### Read
-
### Update
-
### Delete
-

# 
## EXPLICACIÓN DEL USO DE VARIABLES DE SESIÓN
### Explicación
-



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
    apt-get install -y apache2 perl libcgi-pm-perl libtext-csv-perl openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
```
- Instala:
  - Apache: servidor web para servir páginas HTML.
  - Perl: lenguaje para scripts CGI.
  - Bibliotecas para CSV y CGI.
  - Servidor SSH para acceso remoto al contenedor.
- Limpia cachés de instalación para reducir el tamaño de la imagen.
```dockerfile
RUN a2enmod cgid
```
- Activa el módulo CGI en Apache, necesario para ejecutar scripts Perl como aplicaciones web.
```dockerfile
RUN mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
```
- Crea un directorio para SSH.
- Establece una contraseña para el usuario `root`.
- Configura SSH para permitir inicio de sesión como `root`.
- Desactiva el uso de PAM (módulo de autenticación pluggable) para simplificar el acceso.
```dockerfile
RUN mkdir -p /usr/lib/cgi-bin /var/www/html
```
- Crea directorios necesarios:
  - `/usr/lib/cgi-bin`: para scripts CGI.
  - `/var/www/html`: para los archivos HTML del servidor web.
```dockerfile
COPY ./cgi-bin/ /usr/lib/cgi-bin/
COPY ./html/ /var/www/html/
```
- Copia los scripts Perl y archivos HTML desde tu sistema al contenedor.
```dockerfile
RUN chmod +x /usr/lib/cgi-bin/*.pl && \
    chmod -R 755 /usr/lib/cgi-bin/* && \
    chmod -R 755 /var/www/html
```
- Da permisos de ejecución a los scripts CGI y permisos de lectura/escritura adecuados a los directorios.
```dockerfile
EXPOSE 80 22
```
- 80: para el servidor web (HTTP).
- 22: para conexiones SSH.
```dockerfile
CMD ["bash", "-c", "service ssh start && apachectl -D FOREGROUND"]
```
- Inicia ambos servicios:
  - SSH: para acceso remoto.
  - Apache: para servir páginas y ejecutar scripts CGI.

### Comandos
- Copiar este comando para crear la imagen.
```sh
docker build -t miweb .
```
- Copiar este comando para crear el contenerdor.
```sh
docker run -d --name myweb1 -p 8083:80 -p 22:22 miweb
```
#  
## COMMITS MÁS IMPORTANTES
Antes de iniciar el proyecto habíamos decidido que trabajaríamos con ramas, por eso algunos commits aparecerán con nombres de rama diferentes a `main`.
#### Commit "HTML y CSS para la búsqueda de universidades" 
![Commit5]
- En este commit estamos cambiando el fondo de nuestra pagina, ya que inicialmente tenia un fondo de un color.
#### Commit "Búsqueda en el archivo CVS y lógica inicial para la tabla y google maps"
![Commit4]
- Este commit fue de los primeros, pero de los más importantes, ya que aquí se realizó la lógica para leer el archivo cvs como se puede ver en la explicación del código y además se introdujo el condicional para cuando aparezca un "iframe" de google maps o la tabla con las universidades.
#### Commit "Agregando Ubicacion a la tabla"
![Commit3]
- Este commit agregó el campo de dirección para las universidades encontradas en caso fueran varias, este campo nos mandaría a la ubicación de la universidad en Google Maps.
#### Commit creación del caso 'Universidad no encontrada'
![Commit1]
- Este commit agregó el diseño del último caso de las respuestas que da nuestro programa. Sin cerrar el formulario, ahora se mostraría un mensaje con un diseño gozu.
#### Commit de la union de todas las partes 
![Commit2]
- Este commit une todas las partes para que la web funcione correctamente.

#
## EXPLICACIÓN DE CAPTURAS

![Prueba1]
- Esta es la página principal de nuestra página(index.html), en donde se ingresan los datos en los campos requeridos para poder realizar la búsqueda de universidades.

![Prueba2]
- En este caso se ingresa en el campo de "búsqueda de nombre de la universidad" el nombre de "pablo" para poder buscar todas las universidades que incluyan ese nombre.

![Prueba3]
- Como se puede observar al buscar universidades que incluyan el nombre de "pablo" nos muestra a todas las universidades con este nombre, en este caso son 2 y podemos observar sus respectivos datos: código, nombre, tipo, estado, inicio, fin, periodo, departamento, provincia, distrito, dirección.

![Prueba4]
- Una vez realizada la búsqueda, se puede volver a ingresar otros datos para la búsqueda de otras universidades.

![Prueba5]
- En este caso se hace la busqueda de la Universidad Nacional de San Agustín, como podemos observar nos muestra los respectivos datos y la ubicación de Google Maps en un iframe.

![Prueba6]
- En este caso se busca la "universidad Sideral" la cual no existe.

![Prueba7]
- Como podemos observar se muestra una imagen con el mensaje de "universidad no encontrada" y que probemos con otros datos.


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
|     |CALIFICACION|  16   |  2   |     |
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

[Commit1]:https://hackmd.io/_uploads/Sks-94uzJe.jpg
[Commit2]:https://hackmd.io/_uploads/S1Ct9VuGkl.jpg
[Commit3]:https://hackmd.io/_uploads/ryAoc4_M1x.jpg
[Commit4]:https://hackmd.io/_uploads/SJId2EdfJx.jpg
[Commit5]:https://hackmd.io/_uploads/rk5I0Ndfye.jpg


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