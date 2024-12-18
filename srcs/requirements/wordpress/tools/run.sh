wp core download --allow-root --path=$WP_PATH --version=$WP_VERSION
wp config create --allow-root --path=$WP_PATH --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=$SQL_HOST --dbprefix=wp_ --skip-check --dbcollate="utf8_general_ci"
wp core install --url=abollen.42.fr --path=$WP_PATH --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root  --skip-email
wp theme install --allow-root --activate --path=$WP_PATH donovan
chown -R www-data: /var/www/*
chmod -R 755 /var/www/html
exec "$@"