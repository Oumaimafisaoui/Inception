#!/bin/sh

config_file="/var/www/html/wp-config.php"

if [ ! -d "$config_file" ]; then
{
    mkdir -p /var/www/html 
    cd /var/www/html
    wget -q http://wordpress.org/latest.tar.gz && \
        tar -xf latest.tar.gz --strip-components=1 && \
        rm -f latest.tar.gz
    
    wp-cli core config --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=mariadb --dbcharset=utf8 --dbcollate= --force --allow-root
    
    wp-cli core install --url=http://localhost --title="Welcome to My Site" --admin_user=admin --admin_password=adminpass --admin_email=admin@example.com --skip-email  --allow-root
    
    wp-cli user create testuser test@example.com --role=author --user_pass=testpass  --allow-root
    
    wp-cli post create --post_type=page --post_title="Welcome" --post_content="This is a welcome page." --post_status=publish  --allow-root
    
    wp-cli option update show_on_front 'page'
    wp-cli option update page_on_front 2
    
    wp-cli rewrite structure '/%postname%/'
    
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html
}
fi
php7.3-fpm -F 