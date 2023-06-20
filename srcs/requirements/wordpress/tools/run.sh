wp core download --allow-root --path=/var/www/html/wordpress
wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --path=/var/www/html/wordpress --skip-check
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=abollen@student.42lyon.fr --allow-root --path=/var/www/html/wordpress --skip-email
wp theme install --allow-root --activate --path=/var/www/html/wordpress zeever

chown -R www-data: /var/www/*
chmod -R 755 /var/www/html

