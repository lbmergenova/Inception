# Pull the Debian Buster image
FROM debian:buster

# # Установка дополнительных расширений PHP
# RUN apt-get -y update && apt-get -y install php php7.3-fpm php-mbstring php-mysql curl mariadb-client procps
# RUN mkdir -p /run/php
# WORKDIR /var/www/html
# RUN curl -LO https://wordpress.org/latest.tar.gz
# RUN tar xzvf latest.tar.gz; rm latest.tar.gz; chown -R www-data:www-data /var/www/html/wordpress
# # Expose the port for access
# EXPOSE 9000

# COPY ./tools/script_wp.sh /
# COPY ./conf/wp-config-sample.php /var/www/html/wp-config-sample.php
# RUN chmod +x script_wp.sh
# ENTRYPOINT ["./script_wp.sh"]
# CMD ["php-fpm7.3", "--nodaemonize"]
RUN apt-get update && apt-get -y install wget php7.3 php-mysqli php-fpm mariadb-client procps
EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# RUN wget -P /usr/local/bin https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod -R 777 /usr/local/bin/wp-cli.phar && \
#     mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp && \
#     mkdir -p /var/www/wordpress && \
#     mkdir ./run/php/ && \
#     chown -R www-data:www-data /var/www/* \
#     && chmod -R 755 /var/www/*
RUN wget -P /usr/local/bin https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod -R 777 /usr/local/bin/wp-cli.phar && \
    mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp && \
    mkdir -p /var/www/wordpress && \
    mkdir ./run/php/ && \
    chown -R www-data:www-data /var/www/* \ && \
    chmod -R 755 /var/www/*
COPY ./conf/wp-config-sample.php ./var/www/wordpress/

# ARG DB_NAME
# ARG DB_USER
# ARG DB_PASS
# ARG DB_HOST

COPY ./tools/script_wp.sh /
RUN chmod +x script_wp.sh
ENTRYPOINT ["./script_wp.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F"]
# php-fpm7.3 --nodaemonize
