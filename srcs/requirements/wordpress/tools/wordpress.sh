# sed -i "s/database_here/$WORDPRESS_DB_NAME/" /var/www/html/wordpress/wp-config.php
# sed -i "s/username_here/$WORDPRESS_DB_USER/" /var/www/html/wordpress/wp-config.php
# sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" /var/www/html/wordpress/wp-config.php
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /bin/wp
	cd /var/www/html/wordpress/
	wp core download --allow-root --version="6.2.2"
	wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --dbprefix=wp_ --dbcharset=utf8 --dbcollate="utf8_general_ci"
	wp core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=abollen@student.42lyon.fr --skip-email
	wp user create --allow-root "Bite" ¨bite@bite.com --user_pass=$WP_ADMIN_PASSWORD --role=author
	wp theme install --allow-root --activate blocksy
	chown -R www-data: /var/www/*
	chmod -R 755 /var/www/html
else
	echo "Wordpress is already installed"
fi
exec "$@"
