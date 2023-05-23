FROM debian:buster

RUN apt-get update && apt-get install -y php7.3 \
            php7.3-fpm \
            php7.3-mysqli \
            php7.3-json \
            php7.3-curl \
            php7.3-dom \
            php7.3-exif \
            php7.3-fileinfo \
            php7.3-mbstring \
            php7.3-common \
            php7.3-xml \
            php7.3-zip \
            php7.3-redis \
            wget \
            unzip

COPY ./conf/wp-config-create.sh  .
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf
RUN  chmod -R 0777 wp-config-create.sh 
ENTRYPOINT ["./wp-config-create.sh"]
