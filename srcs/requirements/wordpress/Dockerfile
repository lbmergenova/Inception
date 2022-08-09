# Pull the Debian Buster image
FROM debian:buster

# Install php extensions for WordPress
RUN apt-get update && apt-get -y install curl php7.3 php-mysqli php-fpm mariadb-client procps sendmail \
                        php-common php-iconv php-json \
						php-gd php-curl php-xml php-imap\
						php-cgi php-pdo php-soap \
						php-xmlrpc php-posix php-gettext \
						php-ldap php-ctype php-dom \
						php-mbstring php-phar

# Expose the port for access
EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./conf/wp-config-sample.php ./var/www/wordpress/

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp && \
    mkdir -p /var/www/wordpress && \
    mkdir ./run/php/

COPY ./tools/script_wp.sh /
RUN chmod +x script_wp.sh

ENTRYPOINT ["./script_wp.sh"]
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]