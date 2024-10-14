# Use a imagem oficial do PHP com Apache
FROM php:8.2-apache

# Instalar dependências do sistema e extensões do PHP
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_sqlite

WORKDIR /var/www/html
COPY composer.json ./
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer install --no-dev
COPY . .
RUN chown -R www-data:www-data storage bootstrap/cache
RUN a2enmod rewrite
EXPOSE 80
