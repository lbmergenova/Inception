#!/bin/sh

echo "WordPress: script start!";
if [ ! -f /var/www/wordpress/wp-config.php ]; then
echo "WordPress: create config file!";
    cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
    sed -i "s|'database_name_here'|'$DB_NAME'|g" /var/www/wordpress/wp-config.php;
    sed -i "s|'username_here'|'$MYSQL_USER'|g" /var/www/wordpress/wp-config.php;
    sed -i "s|'password_here'|'$MYSQL_PASSWORD'|g" /var/www/wordpress/wp-config.php;
    sed -i "s|'localhost'|'$DB_HOST'|g" /var/www/wordpress/wp-config.php;
    # sed -i "s|'localhost'|'mariadb'|g" /var/www/wordpress/wp-config.php;
    sed -i "s|'wp_home_here'|'https://$DOMAIN_NAME'|g" /var/www/wordpress/wp-config.php;
    sed -i "s|'wp_seturl_here'|'https://$DOMAIN_NAME'|g" /var/www/wordpress/wp-config.php;
    chown -R www-data:www-data /var/www/wordpress
	cd /var/www/wordpress && wp core download --allow-root
	wp core install --allow-root \
				--url=$WORDPRESS_URLL \
				--title=$WORDPRESS_TITLE \
				--admin_user=$WORDPRESS_ADMIN_NICK \
				--admin_password=$WORDPRESS_ADMIN_PASS \
				--admin_email=$WORDPRESS_ADMIN_MAIL
	wp user create --allow-root $WORDPRESS_USER_NICK $WORDPRESS_USER_MAIL --user_pass=$WORDPRESS_USER_PASS
	# wp theme install twentyseventeen --activate --allow-root

	# wp core update-db
fi
echo "WordPress: script start! exec ";
exec "$@"


mv /var/www/wp-config.php /var/www/html/wp-config.php
chown -R www-data:www-data /var/www/*
chown -R 755 /var/www/*
# создаем администратора
wp core install --url="$DOMAIN_NAME" --title="ecole 42" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --path="$WP_PATH" --allow-root

# создаем еще пользователя
wp user create "$MYSQL_USER" kanaeva.bz@yandex.ru --role=author --user_pass="$MYSQL_PASSWORD" --allow-root --path="$WP_PATH"