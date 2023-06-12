FROM debian:buster

RUN apt update;apt upgrade -y;apt install -y nginx

RUN apt install curl -y
RUN apt install sudo -y

RUN apt install openssl -y;
RUN mkdir -p /etc/nginx/ssl;
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/abollen.crt -keyout /etc/nginx/ssl/abollen.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]