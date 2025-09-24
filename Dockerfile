FROM php:8.4-apache

# Instalar dependencias del sistema necesarias para intl
RUN apt-get update && apt-get install -y \
        libicu-dev \
    && docker-php-ext-install intl mysqli pdo pdo_mysql \
    && docker-php-ext-enable intl mysqli pdo pdo_mysql \
    && a2enmod rewrite \
    && apt-get clean && rm -rf /var/lib/apt/lists/*