sleep 10
wp config create --allow-root\
			--dbname=${SQL_DATABASE}\
			--dbuser=${SQL_USER}\
			--dbpass=${SQL_PASSWORD}\
			--dbhost=mysqld:3306 --path=/var/www/wordpress