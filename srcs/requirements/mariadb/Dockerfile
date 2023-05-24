FROM debian:buster

RUN apt update -y;
RUN apt upgrade -y;
RUN apt install -y mariadb-server;
RUN apt install sudo -y;

RUN mkdir -p /var/lib/mysqld;

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY tools/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh

CMD ["sh","/tmp/start.sh"]