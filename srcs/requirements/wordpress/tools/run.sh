wp core download --allow-root --path=/var/www/html/wordpress --version="6.2.2"
wp config create --allow-root --path=/var/www/html/wordpress --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --dbprefix=wp_ --skip-check --dbcollate="utf8_general_ci"
wp core install --url=abollen.42.fr --path=/var/www/html/wordpress --title=Titre --admin_user=root  --admin_password=1234 --admin_email=abollen@student.42lyon.fr --allow-root  --skip-email
wp theme install --allow-root --activate --path=/var/www/html/wordpress zeever
chown -R www-data: /var/www/*
chmod -R 755 /var/www/html
exec "$@"