# Base de imagem
FROM php:8.3-cli

# Instalar dependências do sistema
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
    && docker-php-ext-install gd zip pdo pdo_sqlite \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalar Composer diretamente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configurar o diretório de trabalho
WORKDIR /var/www

# Copiar todos os arquivos para o contêiner
COPY . .

# Instalar as dependências do PHP
RUN composer install --no-dev --optimize-autoloader

# Garantir que o arquivo .env exista
COPY .env.example .env

# Gerar a chave da aplicação
RUN php artisan key:generate

# Executar migrações e otimizações para produção
RUN php artisan config:cache \
    && php artisan route:cache \
    && php artisan view:cache \
    && php artisan migrate --force

# Dar permissão ao diretório de cache e storage
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache /var/www/database

# Garantir permissões corretas para o diretório storage e bootstrap/cache
RUN chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Expor a porta da aplicação
EXPOSE 8000

# Comando para iniciar a aplicação
CMD php artisan serve --host=0.0.0.0 --port=8000
