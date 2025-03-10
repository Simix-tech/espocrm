# Utilizar la imagen base oficial de PHP con Apache
FROM php:8.2-apache

# Instalar extensiones de PHP necesarias
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Habilitar mod_rewrite para Apache
RUN a2enmod rewrite

# Establecer el directorio raíz del documento
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Ajustar la configuración de Apache para usar el nuevo directorio raíz
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Copiar los archivos de EspoCRM al directorio del servidor web
COPY . /var/www/html

# Configurar permisos adecuados para los directorios de EspoCRM
RUN chown -R www-data:www-data /var/www/html \
    && find /var/www/html/ -type d -exec chmod 755 {} \; \
    && find /var/www/html/ -type f -exec chmod 644 {} \;

# Exponer el puerto 80 para acceder a la aplicación
EXPOSE 80

# Iniciar el servidor Apache en modo foreground
CMD ["apache2-foreground"]
