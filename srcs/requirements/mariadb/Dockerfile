# Pull the Debian Buster image
FROM debian:buster

# Install Nginx and Openssl
RUN apt-get update && apt-get -y install mariadb-server procps

# Copy config
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Expose the port for access
EXPOSE 3306

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_ROOT_PASS

RUN service mysql start && \
    echo "CREATE DATABASE $DB_NAME;"| mysql -u root && \
    echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"| mysql -u root && \
    echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"| mysql -u root && \
    echo "FLUSH PRIVILEGES;"| mysql -u root && \
    mysqladmin -u root password ${DB_ROOT_PASS}

CMD ["mysqld"]