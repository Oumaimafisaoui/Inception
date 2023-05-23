#!/bin/sh

config_file="/var/www/html"

if [ ! -d "$config_file" ]; then
{
    mkdir -p /var/www/html && cat w
    wget -q http://wordpress.org/latest.tar.gz && \
        tar -xf latest.tar.gz --strip-components=1 && \
        rm -f latest.tar.gz
    
    wp core config --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=mariadb --dbcharset=utf8 --dbcollate= --force
    
    wp core install --url=http://localhost --title="Welcome to My Site" --admin_user=admin --admin_password=adminpass --admin_email=admin@example.com --skip-email
    
    wp user create testuser test@example.com --role=author --user_pass=testpass
    
    wp post create --post_type=page --post_title="Welcome" --post_content="This is a welcome page." --post_status=publish
    
    wp option update show_on_front 'page'
    wp option update page_on_front 2
    
    wp rewrite structure '/%postname%/'
    
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html
}
fi
