FROM php:8.3-cli
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    sqlite3 \
    libsqlite3-dev \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_sqlite

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
WORKDIR /var/www
COPY . .
RUN composer install
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache /var/www/database
EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000
