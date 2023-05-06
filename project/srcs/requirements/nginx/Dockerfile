FROM debian:buster
RUN apt-get update && apt-get install -y nginx openssl
RUN mkdir -p /etc/nginx/ssl/
RUN openssl req -new -nodes -x509 \
        -out /etc/nginx/ssl/server.crt \
        -keyout /etc/nginx/ssl/server.key \
        -subj "/C=MA/ST=Beni Mellal - Khenifra/L=Khouribga/O=1337/CN=oufisaou.42.fr"
COPY ./conf/nginx.conf ./etc/nginx/
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
