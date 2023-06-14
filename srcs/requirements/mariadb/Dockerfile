FROM debian:bullseye

RUN apt update -y;
RUN apt upgrade -y;
RUN apt install -y mariadb-server mariadb-client;
RUN apt install sudo -y;

RUN mkdir -p /var/lib/mysqld;

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh

RUN mkdir /var/run/mysqld

RUN touch /var/run/mysqld/mysqld.sock

RUN chown -R mysql /var/run/mysqld

CMD ["sh","/tmp/start.sh"]