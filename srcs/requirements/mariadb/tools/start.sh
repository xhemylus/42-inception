service mariadb start;
echo "Bite";
echo BITE - $SQL_ROOT_PASSWORD $SQL_DATABASE $SQL_USER $SQL_PASSWORD
sleep 5;


mysql -u root -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"
mysql -u root -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$SQL_ROOT_PASSWORD');"
mysqladmin -uroot -p${SQL_ROOT_PASSWORD} shutdown