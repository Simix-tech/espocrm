# Usar la imagen oficial de PHP con Apache
FROM php:7.4-apache

# Instalar las extensiones necesarias de PHP
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Habilitar mod_rewrite para Apache
RUN a2enmod rewrite

# Configurar el directorio raíz del documento
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Actualizar la configuración del sitio predeterminada de Apache para usar el directorio raíz del documento
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Copiar los archivos de la aplicación en el contenedor
COPY . /var/www/html

# Dar permisos adecuados a los archivos y directorios de EspoCRM
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Exponer el puerto 80
EXPOSE 80

# Comando para iniciar Apache
CMD ["apache2-foreground"]
