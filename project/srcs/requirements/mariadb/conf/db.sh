#!bin/sh
cd /etc/mysql/mariadb.conf.d/;
sed -i "s/127.0.0.1/0.0.0.0/g" 50-server.cnf;
if [ ! -d /var/lib/mysql/wordpress ]; then
    service mysql start;
    #change the variables to the .env GLOBAL variables
    mysql -u root -e "CREATE DATABASE ${DB_NAME};"
    mysql -u root -r "CREATE USER '${BB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
    mysql -u root -r "CREATE USER '${DB_ROOT}'@'localhost' IDENTIFIED BY '${DB_ROOT}';"
    mysql -u root -r "GRANT ALL PRIVILEGES ON wordpress TO 'admin'@'localhost';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysqladmin shutdown;
fi
tail -f