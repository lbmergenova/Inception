# Pull the Debian Buster image
FROM debian:buster

# Установка дополнительных расширений PHP
RUN apt-get -y update && apt-get -y install mariadb-server php-mysql
RUN cd /var/www/html
RUN curl -LO https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz
# Expose the port for access
EXPOSE 3306

COPY ./tools/script_mariadb.sh /
RUN chmod +x script_mariadb.sh
ENTRYPOINT ["./script_mariadb.sh"]
CMD ["mysqld"]