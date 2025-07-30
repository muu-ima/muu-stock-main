#!/bin/bash

# Laravel キャッシュなど初期処理（必要に応じて）
php artisan config:cache
php artisan migrate --force

# PHP-FPM（バックグラウンド）
php-fpm -D

# Nginx（フォアグラウンド）
nginx -g "daemon off;"
