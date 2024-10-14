# Use a imagem oficial do PHP com Apache
FROM php:8.3-apache

# Instalar dependências do sistema e extensões do PHP
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql

# Definir o diretório de trabalho
WORKDIR /var/www/html

# Copiar o arquivo composer.lock e composer.json
COPY composer.lock composer.json ./

# Instalar o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer install --no-dev

# Copiar o restante do código do aplicativo
COPY . .

# Definir permissões para o diretório storage e bootstrap/cache
RUN chown -R www-data:www-data storage bootstrap/cache

# Habilitar o módulo de reescrita do Apache
RUN a2enmod rewrite

# Expor a porta padrão do Apache
EXPOSE 80
