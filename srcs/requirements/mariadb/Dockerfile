# Pull the Debian Buster image
FROM debian:buster

# Install Nginx and Openssl
RUN apt-get update && apt-get install mariadb-server -y
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/createdb.sql /

# Expose the port for access
EXPOSE 3306

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_ROOT_PASS

RUN sed -i "s/REPLACE_DB_NAME/$DB_NAME/g" /createdb.sql && \
    sed -i "s/REPLACE_USER/$DB_USER/g" /createdb.sql && \
    sed -i "s/REPLACE_PASSWORD/$DB_PASS/g" /createdb.sql && \ 
    sed -i "s/REPLACE_ROOT_PASS/$DB_ROOT_PASS/g" /createdb.sql
RUN service mysql start && mysql < createdb.sql
RUN rm -f createdb.sql
CMD /usr/bin/mysqld_safe
