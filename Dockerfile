# Utiliza una imagen base con PHP y Apache
FROM php:8.2-apache

# Instala las extensiones PHP necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Habilita mod_rewrite para Apache
RUN a2enmod rewrite

# Copia los archivos de EspoCRM y el script de instalación al contenedor
COPY . /var/www/html/
COPY install.sh /var/www/html/

# Ejecuta el script de instalación
RUN /var/www/html/install.sh

# Ajusta los permisos de los directorios y archivos según las recomendaciones de EspoCRM
RUN chown -R www-data:www-data /var/www/html/ \
    && find /var/www/html/ -type d -exec chmod 755 {} \; \
    && find /var/www/html/ -type f -exec chmod 644 {} \;

# Configura el DocumentRoot y actualiza la configuración de Apache
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Expone el puerto 80
EXPOSE 80

# Comando para iniciar Apache en modo foreground
CMD ["apache2-foreground"]
