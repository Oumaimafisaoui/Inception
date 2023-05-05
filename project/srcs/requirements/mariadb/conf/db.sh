#!bin/sh
cd /etc/mysql/mariadb.conf.d/;
sed -i "s/127.0.0.1/0.0.0.0/g" 50-server.cnf;
if [ ! -d /var/lib/mysql/wordpress ]; then
    service mysql start;
    #change the variables to the .env GLOBAL variables
    mysql -u root -e "CREATE DATABASE ${DB_NAME};"
    mysql -u root -r "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';"
    mysql -u root -r "CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';"
    mysql -u root -r "GRANT ALL PRIVILEGES ON wordpress TO 'admin'@'localhost';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysqladmin shutdown;
fi
tail -f