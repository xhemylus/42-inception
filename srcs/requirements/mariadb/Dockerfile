FROM debian:bullseye

ARG SQL_ROOT_PASSWORD
ARG SQL_USER
ARG SQL_DATABASE
ARG SQL_HOSTNAME
ARG SQL_PASSWORD


RUN apt update -y;
RUN apt upgrade -y;
RUN apt install -y mariadb-server mariadb-client;
RUN apt install sudo -y;

RUN mkdir -p /var/lib/mysql;
RUN mkdir -p /var/run/mysql

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh

RUN chown -R mysql:mysql /var/run/mysql
RUN chmod -R 777 /var/run/mysql

RUN sh /tmp/start.sh

EXPOSE 3306

CMD ["mysqld_safe", "--console"]
