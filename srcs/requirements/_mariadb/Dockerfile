# Pull the Debian Buster image
FROM debian:buster

# Установка дополнительных расширений PHP
RUN apt-get -y update && apt-get -y install mariadb-server procps
# Expose the port for access
EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/ /
RUN chmod +x script_db.sh

# CMD ip a && /usr/bin/mysqld_safe
ENTRYPOINT ["./script_db.sh"]
# CMD ["/usr/bin/mysqld_safe"]
CMD ["mysqld"]