#!/bin/sh
    mkdir -p /run/php/;
	touch /run/php/php7.3-fpm.pid; #Store PID files for PHP processes managed by the PHP-FPM
	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
config_file="/var/www/html/wp-config.php"

if [ ! -d "$config_file" ]; then
{
    mkdir -p /var/www/html 
    cd /var/www/html

    wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    wp core download --locale=en_US --allow-root
    mv wp-config-sample.php wp-config.php
    sed -i "s/database_name_here/${DB_NAME}/g" wp-config.php
    sed -i "s/username_here/${DB_USER}/g" wp-config.php
    sed -i "s/password_here/${DB_PASS}/g" wp-config.php
    sed -i "s/localhost/mariadb/g" wp-config.php

    wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=mariadb --locale=en_US --allow-root
    
    wp core install --url=https://localhost --title="Welcome to My Site" --admin_user=admin --admin_password=adminpass --admin_email=admin@example.com --skip-email --allow-root 
    
}
fi
exec "$@"
