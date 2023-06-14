FROM debian:bullseye

RUN apt update -y;
RUN apt upgrade -y;
RUN apt install -y wget;

# RUN apt install -y php7.3;
# RUN apt install -y php7.3-fpm
# RUN apt install -y php7.3-mysql;
# RUN apt-get clean -y && apt-get autoremove -y

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wget mariadb-client php7.4 php7.4-fpm
RUN apt-get install -y php7.4-curl php7.4-dom php7.4-exif php7.4-fileinfo php7.4-imagick php7.4-mbstring php7.4-mysqli php7.4-xml php7.4-zip
RUN apt-get clean -y && apt-get autoremove -y

RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www/html;
RUN cd /var/www/html && tar -xvf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz;

COPY conf/php-fpm.conf /etc/php/7.3/fpm/
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar;
RUN mv wp-cli.phar /usr/local/bin/wp;
RUN useradd -ms /bin/bash abollen

RUN chown -R root:root /var/www/html/wordpress
WORKDIR /var/www/html/wordpress

RUN mkdir /var/run/php/

COPY tools/run.sh /tmp/

RUN touch /var/www/html/bite.html

CMD [ "sh", "/tmp/run.sh" ]