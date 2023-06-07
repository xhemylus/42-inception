sleep 5

wp core download --allow-root --path=/var/www/html/wordpress
wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path=/var/www/html/wordpress --skip-check
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=abollen@student.42lyon.fr --allow-root --path=/var/www/html/wordpress
php-fpm7.3 -F