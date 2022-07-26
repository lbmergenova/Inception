#!/bin/sh

echo "NGINX: script start!";
if [ ! -f /etc/nginx/private.key ]; then
echo "NGINX: set ssl start";
openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out /etc/nginx/certificate.crt \
-keyout /etc/nginx/private.key -subj "/C=RU/ST=Moscow/L=Moscow /O=21 School/OU=srorscha/CN=srorscha.42.fr/emailAddress=unknown"
echo "NGINX: set ssl done!";
fi
exec "$@"
