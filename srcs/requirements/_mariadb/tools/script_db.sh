#!/bin/sh

if [ -f /createdb.sql ]; then
# chown -R mysql:mysql /var/lib/mysql
echo "Mariadb: sed password!"
sed -i "s|REPLACE_DB_NAME|$MYSQL_NAME|g" /createdb.sql
sed -i "s|REPLACE_USER|$MYSQL_USER|g" /createdb.sql
sed -i "s|REPLACE_PASSWORD|$MYSQL_PASSWORD|g" /createdb.sql
sed -i "s|REPLACE_ROOT_PASS|$MYSQL_ROOT_PASSWORD|g" /createdb.sql
echo "Mariadb: create DB!"
service mysql start
# /etc/init.d/mysql start
mysql -V
mysql -u root < /createdb.sql
# echo "CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;" | mysql -u root
# echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root
# echo "GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;" | mysql -u root
# echo "FLUSH PRIVILEGES;" | mysql --no-defaults -u root
# echo "Mariadb stop!"
service mysql stop
echo "Mariadb: remove createdb.sql!"
cat createdb.sql
rm -f createdb.sql
fi
exec "$@"





# # Проверяем существует ли пользователь, если нет то создаем
# find_my_user=$(echo "SELECT USER from mysql.user;" | mysql --no-defaults -u root | grep "$DB_USER" | wc -l)

# if [ "1" -ne $find_my_user ] ;
# 	then 
# 		echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql --no-defaults -u root
# 		echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' WITH GRANT OPTION;" | mysql --no-defaults -u root
# 		echo "FLUSH PRIVILEGES;" | mysql --no-defaults -u root ;
# fi

# # Проверяем существует ли база данных, если нет то создаем
# find_my_database=$(echo "SHOW DATABASES;" | mysql --no-defaults -u root | grep "$DB_NAME" | wc -l)

# if [ "1" -ne $find_my_database ] ;
# 	then echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql --no-defaults -u $DB_USER --password="$DB_PASSWORD" ;
# 	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');" | mysql --no-defaults -u root ;
# fi


# # Отключаем, чтобы перезапустить вне фонового режима
# service mysql stop

# mysqld_safe
