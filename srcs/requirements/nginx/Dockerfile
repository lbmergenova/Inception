# Pull the Debian Buster image
FROM debian:buster

# Install Nginx and Openssl
RUN apt-get -y update && apt-get -y install nginx && apt-get -y install openssl

# Copy the Nginx config
COPY ./conf/default /etc/nginx/sites-available/default
# https://www.netnea.com/cms/nginx-tutorial-2_minimal-nginx-configuration/
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY ./conf/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

# Expose the port for access
EXPOSE 443

COPY ./tools/script_nginx.sh /
CMD ["sh", "script_nginx.sh"]