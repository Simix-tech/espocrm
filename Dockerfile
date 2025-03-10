# Usar la imagen oficial de PHP
FROM php:7.4-fpm

# Instalar las extensiones necesarias de PHP
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Copiar los archivos de la aplicación en el contenedor
COPY . /var/www/html

# Dar permisos adecuados a los archivos y directorios de EspoCRM
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Configurar el directorio de trabajo
WORKDIR /var/www/html

# El contenedor está configurado para usar fpm para procesar PHP
CMD ["php-fpm"]
