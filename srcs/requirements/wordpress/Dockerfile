FROM debian:buster

# Install php extensions
RUN apt-get update && apt-get install -y php-fpm php-mysql curl

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp && \
    mkdir -p /var/www/wordpress && \
    mkdir ./run/php/

# Create folder and change owner
RUN mkdir -p /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

# Copy config
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# Expose the port for access
EXPOSE 9000

COPY ./tools/script_wp.sh ./
RUN chmod +x script_wp.sh

ENTRYPOINT ["./script_wp.sh"]
