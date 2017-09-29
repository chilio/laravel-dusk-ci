#!/bin/bash
cd ${CI_PROJECT_DIR}
chmod -R 775 storage
chmod 775 bootstrap/cache
chown -R www-data ./
php artisan key:generate
php artisan migrate:fresh --seed
