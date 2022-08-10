#!/bin/sh

if [ ! -f /var/www/wordpress/index.php ] ; then
echo "Install wordpress"

wp core download    --allow-root --path="/var/www/wordpress"

wp core config	--allow-root \
				--skip-check \
				--dbname=$DB_NAME \
				--dbuser=$MYSQL_USER \
				--dbpass=$MYSQL_PASSWORD \
				--dbhost=$DB_HOST \
				--dbprefix=$DB_PREFIX \
				--path="/var/www/wordpress"

wp core install	--allow-root \
				--url=$DOMAIN_NAME \
				--title="Inception" \
				--admin_user=$WP_ADMIN_NICK \
				--admin_password=$WP_ADMIN_PASS \
				--admin_email=$WP_ADMIN_MAIL \
				--path="/var/www/wordpress"

wp user create  $WP_USER_NICK $WP_USER_MAIL \
				--role=author \
				--user_pass=$WP_USER_PASS \
				--allow-root \
				--path="/var/www/wordpress"

# wp theme install twentytwentyone --activate --allow-root

fi

service php7.3-fpm start ;
service php7.3-fpm stop ;

exec php-fpm7.3 --nodaemonize