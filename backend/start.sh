#!/bin/bash

# Laravel キャッシュなど初期処理（必要に応じて）
php artisan config:cache
php artisan migrate --force

echo "=== NGINX CONFIGS ==="
cat /etc/nginx/conf.d/default.conf

echo "=== PUBLIC DIRECTORY ==="
ls -al /var/www/html/public

echo "=== ACCESS LOG ==="
cat /var/log/nginx/access.log || echo "No access log"

echo "=== ERROR LOG ==="
cat /var/log/nginx/error.log || echo "No error log"

echo "=== NGINX CONF FILES ==="
ls -l /etc/nginx/conf.d/
ls -l /etc/nginx/sites-enabled/

# PHP-FPM（バックグラウンド）
php-fpm -D

# Nginx（フォアグラウンド）
nginx -g "daemon off;"
