#!/bin/sh

echo "NGINX: script start!";
if [ ! -f /etc/ssl/certs/nginx-selfsigned.crt ]; then
echo "NGINX: set ssl start";
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
        -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=KazanCampus/CN=sfearow.42.fr";
openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048;
echo "NGINX: set ssl done!";
fi
nginx -c /etc/nginx/nginx.conf;
