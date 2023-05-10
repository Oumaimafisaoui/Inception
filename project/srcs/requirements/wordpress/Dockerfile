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
RUN  chmod -R 0777 wp-config-create.sh 
RUN chmod +x wp-config-create.sh
ENTRYPOINT tail -f
