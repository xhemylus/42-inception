FROM debian:bullseye

RUN apt-get update -y;
RUN apt-get upgrade -y;
RUN apt-get install -y nginx openssl;
RUN apt-get install clean -y;
RUN apt-get autoremove -y;

EXPOSE 443

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
						-keyout /etc/ssl/private/nginx.key \
						-out /etc/ssl/certs/nginx.crt \
						-subj "/C=FR/ST=Lyon/L=Lyon/O=42Lyon/OU=abollen/CN=abollen"

CMD ["nginx", "-g", "daemon off;"]
