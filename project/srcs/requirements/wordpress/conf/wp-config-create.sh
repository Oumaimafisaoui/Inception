#!/bin/sh]


# sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf

config_file="/var/www/html/config.php"

if [ ! -d "$config_file" ]; then
    {
        mkdir -p /var/www/html && cd /var/www/html
        wget -q http://wordpress.org/latest.tar.gz && \
            tar -xf latest.tar.gz --strip-components=1 && \
            rm -f latest.tar.gz && \
        
        echo "<?php"
        echo "define( 'DB_NAME', '${DB_NAME}' );"
        echo "define( 'DB_USER', '${DB_USER}' );"
        echo "define( 'DB_PASSWORD', '${DB_PASS}' );"
        echo "define( 'DB_HOST', 'mariadb' );"
        echo "define( 'DB_CHARSET', 'utf8' );"
        echo "define( 'DB_COLLATE', '' );"
        echo "define('FS_METHOD','direct');"
        echo "\$table_prefix = 'wp_';"
        echo "define( 'WP_DEBUG', false );"
        echo "if ( ! defined( 'ABSPATH' ) ) {"
        echo "define( 'ABSPATH', __DIR__ . '/' );"
        echo "}"
        # echo "define( 'WP_REDIS_HOST', 'redis' );"
        # echo "define( 'WP_REDIS_PORT', 6379 );"
        # echo "define( 'WP_REDIS_TIMEOUT', 1 );"
        # echo "define( 'WP_REDIS_READ_TIMEOUT', 1 );"
        # echo "define( 'WP_REDIS_DATABASE', 0 );"
        echo "require_once ABSPATH . 'wp-settings.php';"
    } > "$config_file"

    mkdir /run/php && chown root:root /run/php && chmod 755 /run/php
   
fi
/usr/sbin/php-fpm7.3 -F