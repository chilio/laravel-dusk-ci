#!/bin/bash
sed -i "s|root /var/www/html/public;|root $(pwd)/public;|" /etc/nginx/sites-available/default
service php7.4-fpm start
service nginx start
