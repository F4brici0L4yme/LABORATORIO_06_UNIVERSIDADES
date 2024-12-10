FROM bitnami/minideb

ENV DEBIAN_FRONTEND="noninteractive"

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y apache2 perl libcgi-pm-perl libtext-csv-perl mariadb-server mariadb-client libdbd-mysql-perl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Habilitar módulos CGI de Apache
RUN a2enmod cgid

# Crear directorios necesarios y ajustar permisos
RUN mkdir -p /usr/lib/cgi-bin /usr/lib/puml_files /var/www/html /var/lib/mysql /run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /run/mysqld && \
    chmod -R 755 /usr/lib/cgi-bin && \
    chmod -R 755 /var/www/html && \
    chown -R www-data:www-data /usr/lib/puml_files && \
    chmod -R 755 /usr/lib/puml_files

# Inicializar MariaDB sin autenticación
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

# Copiar scripts CGI y archivos HTML
COPY ./cgi-bin/ /usr/lib/cgi-bin/
COPY ./html/ /var/www/html/
COPY ./puml_files/ /usr/lib/puml_files/

# Copiar el script SQL de inicialización y ajustar permisos
COPY ./init_db.sql /docker-entrypoint-initdb.d/
RUN chmod 644 /docker-entrypoint-initdb.d/init_db.sql && \
    chown mysql:mysql /docker-entrypoint-initdb.d/init_db.sql

# Ajustar permisos de scripts CGI
RUN chmod +x /usr/lib/cgi-bin/*.pl

# Comando para iniciar MariaDB sin autentificación y Apache
CMD ["/bin/bash", "-c", "mysqld --datadir=/var/lib/mysql --user=mysql --skip-grant-tables & sleep 5 && mysql < /docker-entrypoint-initdb.d/init_db.sql && apachectl -D FOREGROUND"]

# Exponer el puerto 80
EXPOSE 80