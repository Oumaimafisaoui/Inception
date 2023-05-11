#!/bin/sh

config_file="/var/www/html"

if [ ! -d "$config_file" ]; then
{
    mkdir -p /var/www/html && cat w
    wget -q http://wordpress.org/latest.tar.gz && \
        tar -xf latest.tar.gz --strip-components=1 && \
        rm -f latest.tar.gz
    
    # echo "<?php"
    # echo "define( 'DB_NAME', '${DB_NAME}' );"
    # echo "define( 'DB_USER', '${DB_USER}' );"
    # echo "define( 'DB_PASSWORD', '${DB_PASS}' );"
    # echo "define( 'DB_HOST', 'mariadb' );"
    # echo "define( 'DB_CHARSET', 'utf8' );"
    # echo "define( 'DB_COLLATE', '' );"
    # echo "define('FS_METHOD','direct');"
    # echo "\$table_prefix = 'wp_';"
    # echo "define( 'WP_DEBUG', false );"
    # echo "if ( ! defined( 'ABSPATH' ) ) {"
    # echo "define( 'ABSPATH', __DIR__ . '/' );"
    # echo "}"
# } > "$config_file"

    mkdir /run/php && chown root:root /run/php && chmod 755 /run/php
}
fi
tail -f