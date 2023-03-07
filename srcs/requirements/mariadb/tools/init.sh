


#!/bin/sh


# checking if the db folder exist

# check if the db folder exist
# if [ ! -d /var/lib/mysql/$MYSQL_NAME ]; then
    # if yes
    # echo "data base doesn't exist"
    # service mysql start
    # echo "db started"
    # mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;\
    # ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';\
    # GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
    # FLUSH PRIVILEGES;"
    # kill mysql process
    # killall mqld
# fi

/etc/init.d/mysql start && mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;\
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';\
GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
FLUSH PRIVILEGES;" &&  service mysql stop

exec "$@"
