#!/bin/sh
config_file="/var/www/wp-config.php"

if [ ! -f "$config_file" ]; then
    {
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
fi