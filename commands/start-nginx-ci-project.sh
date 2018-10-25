#!/bin/bash
sed -i "s|root /var/www/html/public;|root ${CI_PROJECT_DIR}/public;|" /etc/nginx/sites-available/default
service php7.3-fpm start
service nginx start