#!/bin/bash
cd ${CI_PROJECT_DIR}
chmod -R 775 storage
chmod 775 bootstrap/cache
chown -R www-data ./
php artisan key:generate
php artisan storage:link
if php artisan --version | grep "Laravel Framework 5.4."; then
    php artisan migrate:refresh --seed
else
    php artisan migrate:fresh --seed
fi
chrome-system-check
sleep 10s
