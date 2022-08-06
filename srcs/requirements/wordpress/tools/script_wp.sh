#!/bin/sh

echo "WordPress: script start!";
if [ ! -f /var/www/wordpress/wp-config.php ]; then
echo "WordPress: create config file!";
    cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
    sed -i "s|'database_name_here'|'$MYSQL_NAME'|g" /var/www/wordpress/wp-config.php;
    sed -i "s|'username_here'|'$MYSQL_USER'|g" /var/www/wordpress/wp-config.php;
    sed -i "s|'password_here'|'$MYSQL_PASSWORD'|g" /var/www/wordpress/wp-config.php;
    sed -i "s|'localhost'|'$MYSQL_HOST'|g" /var/www/wordpress/wp-config.php;
    chown -R www-data:www-data /var/www/wordpress
	cd /var/www/wordpress && wp core download --allow-root
	wp core install --allow-root \
				--url=$WORDPRESS_URLL \
				--title=$WORDPRESS_TITLE \
				--admin_user=$WORDPRESS_ADMIN_NICK \
				--admin_password=$WORDPRESS_ADMIN_PASS \
				--admin_email=$WORDPRESS_ADMIN_MAIL
	wp user create --allow-root $WORDPRESS_USER_NICK $WORDPRESS_USER_MAIL --user_pass=$WORDPRESS_USER_PASS
	# wp theme activate twentysixteen

	#  Без этих записей не подгружеат таблицу стилей и остальной контент

	sed "2idefine('WP_HOME','https://$DOMIAN_NAME');" /var/www/wordpress/wp-config.php >> /var/www/wordpress/wp-config.php.new
	mv /var/www/wordpress/wp-config.php.new /var/www/wordpress/wp-config.php
	sed "2idefine('WP_SITEURL','https://$DOMIAN_NAME');" /var/www/wordpress/wp-config.php >> /var/www/wordpress/wp-config.php.new
	mv /var/www/wordpress/wp-config.php.new /var/www/wordpress/wp-config.php

	# wp core update-db
fi
echo "WordPress: script start! exec ";
exec "$@"
