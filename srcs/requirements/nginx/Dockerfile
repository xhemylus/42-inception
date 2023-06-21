FROM debian:bullseye

RUN apt-get update -y;
RUN apt-get upgrade -y;
RUN apt-get install -y nginx openssl;
RUN apt-get clean -y;
RUN apt-get autoremove -y;

EXPOSE 443

RUN openssl req -x509 -nodes -out /etc/ssl/abollen.crt -keyout /etc/ssl/abollen.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=abollen.42.fr"

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
