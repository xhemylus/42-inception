wp core download --allow-root
wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --dbprefix=wp_ --skip-check --dbcollate="utf8_general_ci"
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=abollen@student.42lyon.fr --allow-root  --skip-email
wp theme install --allow-root --activate --path=/var/www/html/wordpress zeever

chown -R www-data: /var/www/*
chmod -R 755 /var/www/html
exec "$@"