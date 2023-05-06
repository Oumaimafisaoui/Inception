FROM debian:buster

ARG DB_NAME 
ARG DB_USER 
ARG DB_PASS 
ARG DB_ROOT

RUN apt-get update && apt-get install -y mariadb-server
COPY conf/db.sh /etc/mysql/db.sh
RUN chmod +x /etc/mysql/db.sh

EXPOSE 3306

ENTRYPOINT ["/etc/mysql/db.sh"]
