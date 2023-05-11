FROM debian:buster

RUN apt-get update && apt-get install -y php \
            php-fpm \
            php-mysqli \
            php-json \
            php-curl \
            php-dom \
            php-exif \
            php-fileinfo \
            php-mbstring \
            php-common \
            php-xml \
            php-zip \
            php-redis \
            wget \
            unzip

COPY ./conf/wp-config-create.sh  .
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf
RUN  chmod -R 0777 wp-config-create.sh 
ENTRYPOINT ["./wp-config-create.sh"]
