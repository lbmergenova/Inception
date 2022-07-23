# Pull the Debian Buster image
FROM debian:buster

# Install Nginx and Openssl
RUN apt-get -y update && apt-get -y install nginx && apt-get -y install openssl

# RUN openssl version
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-key.crt -out /etc/nginx/ssl/nginx.key -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=KazanCampus/CN=sfearow.42.fr";

RUN cat /etc/nginx/ssl/nginx-key.crt
RUN cat /etc/nginx/ssl/nginx.key
# Copy the Nginx config
COPY ./conf/default /etc/nginx/sites-available/default
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN cat /etc/nginx/nginx.conf

# Expose the port for access
EXPOSE 443

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
# COPY ./tools/script_nginx.sh /
# CMD ["bash", "script_nginx.sh"]