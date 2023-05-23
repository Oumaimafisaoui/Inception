FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server
COPY conf/db.sh /etc/mysql/db.sh
RUN chmod +x /etc/mysql/db.sh

EXPOSE 3306

ENTRYPOINT ["/etc/mysql/db.sh"]
