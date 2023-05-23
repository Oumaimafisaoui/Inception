#!/bin/sh

config_file="/var/www/html/wp-config.php"

if [ ! -d "$config_file" ]; then
{
    mkdir -p /var/www/html 
    cd /var/www/html

    wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    wp core download --locale=en_US --allow-root
    wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=mariadb --locale=en_US --allow-root
    
    wp core install --url=https://localhost --title="Welcome to My Site" --admin_user=admin --admin_password=adminpass --admin_email=admin@example.com --skip-email --allow-root 
    
    mkdir -p /run/php
    chown -R www-data:www-data /var/www/html
}
fi
php7.3-fpm -F -R
