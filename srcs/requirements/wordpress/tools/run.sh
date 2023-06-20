wp core download --allow-root --path=/var/www/html/wordpress --version="6.2.2"
sleep 10
wp config create --allow-root --path=/var/www/html/wordpress --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --dbprefix=wp_ --skip-check --dbcollate="utf8_general_ci"
sleep 10
wp core install --url=$WP_URL --path=/var/www/html/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=abollen@student.42lyon.fr --allow-root  --skip-email
sleep 10
wp theme install --allow-root --activate --path=/var/www/html/wordpress zeever
sleep 10
chown -R www-data: /var/www/*
chmod -R 755 /var/www/html
exec "$@"