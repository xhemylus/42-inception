FROM debian:buster

RUN apt update -y;
RUN apt upgrade -y;
RUN apt install -y wget;

RUN apt install -y php7.3;
RUN apt install -y php7.3-fpm
RUN apt install -y php-mysql;
RUN apt install -y mariadb-client;

RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www/;
RUN cd /var/www && tar -xvf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz;

COPY conf/php-fpm.conf /etc/php/7.3/fpm/
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar;
RUN mv wp-cli.phar /usr/local/bin/wp;
RUN useradd -ms /bin/bash abollen

RUN chown -R root:root /var/www/wordpress
WORKDIR /var/www/wordpress

RUN mkdir /var/run/php/

COPY tools/run.sh /tmp/

EXPOSE 9000

CMD [ "sh", "/tmp/run.sh" ]