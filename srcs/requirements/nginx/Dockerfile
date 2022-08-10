# Pull the Debian Buster image
FROM debian:buster

# Install Nginx and Openssl
RUN apt-get -y update && apt-get -y install nginx openssl procps

# Copy the Nginx config
# https://www.netnea.com/cms/nginx-tutorial-2_minimal-nginx-configuration/
COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Expose the port for access
EXPOSE 443

COPY ./tools/script_nginx.sh /
RUN chmod +x script_nginx.sh
ENTRYPOINT ["./script_nginx.sh"]
CMD ["nginx", "-c", "/etc/nginx/nginx.conf"]
