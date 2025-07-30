#!/bin/bash

# Laravel キャッシュなど初期処理（必要に応じて）
php artisan config:cache
php artisan migrate --force

echo "=== NGINX CONFIGS ==="
cat /etc/nginx/conf.d/default.conf

echo "=== PUBLIC DIRECTORY ==="
ls -al /var/www/html/public

# PHP-FPM（バックグラウンド）
php-fpm -D

# Nginx（フォアグラウンド）
nginx -g "daemon off;"
