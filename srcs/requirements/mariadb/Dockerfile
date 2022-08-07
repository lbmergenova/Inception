# Pull the Debian Buster image
FROM debian:buster

# Установка дополнительных расширений PHP
RUN apt-get -y update && apt-get -y install mariadb-server procps
# Expose the port for access
EXPOSE 3306

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_ROOT_PASS

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/createdb.sql /
# COPY ./tools/script_mariadb.sh /
# RUN chmod +x script_mariadb.sh
RUN chown -R mysql:mysql /var/lib/mysql

RUN sed -i "s/REPLACE_DB_NAME/$DB_NAME/g" /createdb.sql && \
    sed -i "s/REPLACE_USER/$DB_USER/g" /createdb.sql && \
    sed -i "s/REPLACE_PASSWORD/$DB_PASS/g" /createdb.sql && \ 
    sed -i "s/REPLACE_ROOT_PASS/$DB_ROOT_PASS/g" /createdb.sql

RUN service mysql start && mysql < createdb.sql && rm -f createdb.sql

# CMD ["mysqld"]
CMD ip a && /usr/bin/mysqld_safe