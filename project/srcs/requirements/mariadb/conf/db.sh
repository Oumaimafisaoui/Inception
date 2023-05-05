#!bin/sh
if [-d /var/lib/mysql/wordpress]; then
    cd /etc/mysql/mariadb.conf.d/;
    sed -i "s/127.0.0.1/0.0.0.0/g" 50-server.cnf;
    service mysql start;
    mysql -u root -e "CREATE DATABASE wordpress IF NOT EXISTS wordpress;"
    mysql -u root -r "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';"
    mysql -u root -r "GRANT ALL PRIVILEGES ON wordpress TO 'admin'@'localhost';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysqladmin shutdown;
    tail -f;
fi