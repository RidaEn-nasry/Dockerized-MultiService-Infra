

# MARIADB_NAME=$(echo $MYSQL_NAME)
# MARIADB_USER=$(echo $MYSQL_USER)
# MARIADB_PASS=$(echo $MYSQL_PASSWORD)
# MARIADB_ROOT_PASS=$(echo $MYSQL_ROOT_PASSWORD)

# # Create user and database
# echo "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;" > /home/init_mariadb.sql
# echo "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASS';" >> /home/init_mariadb.sql
# echo "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';" >> /home/init_mariadb.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASS';" >> /home/init_mariadb.sql
# echo "FLUSH PRIVILEGES;" >> /home/init_mariadb.sql

echo "CREATE DATABASE IF NOT EXISTS wordpress_db;" > /home/init_mariadb.sql
echo "CREATE USER IF NOT EXISTS 'wordpress_user'@'%' IDENTIFIED BY '1234';" >> /home/init_mariadb.sql
echo "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress_user'@'%';" >> /home/init_mariadb.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpass';" >> /home/init_mariadb.sql
echo "FLUSH PRIVILEGES;" >> /home/init_mariadb.sql
