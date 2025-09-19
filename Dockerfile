FROM php:8.4-apache

# Instalar extensiones necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli pdo_mysql

# Habilitar mod_rewrite si lo necesitas
RUN a2enmod rewrite