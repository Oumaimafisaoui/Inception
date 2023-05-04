FROM debian:buster
RUN apt-get update && apt-get install -y nginx
COPY ./tools/server.crt ./tools/server.key ./conf/nginx.conf /etc/nginx/

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]