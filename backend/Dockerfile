FROM php:8.3-fpm

# 必要パッケージと nginx
RUN apt-get update && apt-get install -y \
    nginx \
    git unzip curl libzip-dev libpng-dev libonig-dev libxml2-dev zip \
    libpq-dev \ 
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql zip

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 作業ディレクトリ
WORKDIR /var/www/html

# コードコピー
COPY . .

# Laravel セットアップ
RUN composer install \
    && chown -R www-data:www-data storage bootstrap/cache

# Nginx 設定
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Start スクリプト
COPY ./start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80
CMD ["/start.sh"]
