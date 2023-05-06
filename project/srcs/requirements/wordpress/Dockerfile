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
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf
WORKDIR /var/www/html
RUN wget -q http://wordpress.org/latest.tar.gz && \
    tar -xf latest.tar.gz --strip-components=1 && \
    rm -f latest.tar.gz
COPY ./conf/wp-config-create.sh  .
RUN  chmod -R 0777 wp-content && sh wp-config-create.sh 
EXPOSE 80
CMD tail -f

