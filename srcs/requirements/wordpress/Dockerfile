FROM debian:bullseye

RUN apt update -y;
RUN apt upgrade -y;
RUN apt install -y wget;

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wget mariadb-client php7.4 php7.4-fpm
RUN apt-get install -y php7.4-curl php7.4-dom php7.4-exif php7.4-fileinfo php7.4-imagick php7.4-mbstring php7.4-mysqli php7.4-xml php7.4-zip
RUN apt-get clean -y && apt-get autoremove -y

COPY conf/php-fpm.conf /etc/php/7.3/fpm/
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY tools/run.sh /tmp/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar;
RUN mv wp-cli.phar /usr/local/bin/wp;

WORKDIR /var/www/html/wordpress

RUN mkdir /var/run/php/
RUN mkdir -p /run/php

EXPOSE 9000

RUN adduser -S www-data -G www-data -h /var/www/html

#ENTRYPOINT [ "sh", "/tmp/run.sh" ]

WORKDIR /var/www/html/
CMD ["/usr/sbin/php-fpm7.4", "-F", "-R"]
