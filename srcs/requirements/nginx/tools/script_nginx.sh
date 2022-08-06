#!/bin/sh

if [ ! -f /etc/nginx/private.key ]; then
openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out /etc/nginx/certificate.crt \
-keyout /etc/nginx/private.key -subj "/C=RU/ST=RT/L=Kazan/O=21 School/OU=sfearow/CN=sfearow.42.fr/emailAddress=unknown"
fi
exec "$@"
