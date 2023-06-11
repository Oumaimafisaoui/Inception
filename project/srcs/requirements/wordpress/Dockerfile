FROM debian:buster

RUN apt-get update && apt-get install -y php7.3 \
            php7.3-fpm \
            php7.3-mysql \
            curl \
            mariadb-client 

COPY ./conf/wp-config-create.sh  .
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod 0777 wp-config-create.sh 

ENTRYPOINT ["./wp-config-create.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F", "--nodaemonize"]
