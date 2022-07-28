# Pull the Debian Buster image
FROM debian:buster

# Установка дополнительных расширений PHP
RUN apt-get -y update && apt-get -y install php php7.3-fpm php-mbstring php-mysql
RUN cd /var/www/html
RUN curl -LO https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz
# Expose the port for access
EXPOSE 9000

COPY ./tools/script_wp.sh /
RUN chmod +x script_wp.sh
ENTRYPOINT ["./script_wp.sh"]
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
