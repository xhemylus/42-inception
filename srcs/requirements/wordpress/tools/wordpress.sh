# sed -i "s/database_here/$WORDPRESS_DB_NAME/" /var/www/html/wordpress/wp-config.php
# sed -i "s/username_here/$WORDPRESS_DB_USER/" /var/www/html/wordpress/wp-config.php
# sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" /var/www/html/wordpress/wp-config.php
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /bin/wp
	cd /var/www/html/wordpress/
	wp core download --allow-root --version=$WORDPRESS_VERSION
	wp config create --allow-root --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbprefix=wp_ --dbcharset=$WORDPRESS_CHARSET --dbcollate="utf8_general_ci"
	wp core install --allow-root --url=$WORDPRESS_URL --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email
	wp user create --allow-root $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role=author
	wp theme install --allow-root --activate blocksy
	chown -R www-data: /var/www/*
	chmod -R 755 /var/www/html
else
	echo "Wordpress is already installed"
fi
exec "$@"
