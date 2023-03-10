


#!/bin/sh


# if database already exis only run exec "$@"
if [ -d /var/lib/mysql/$MYSQL_NAME ]; then
    echo "database already exists"
    exec "$@"
    # if database does not exist, create it
else
# execute the scl script "createdb.sql"
    echo "database does not exist"
    echo "starting mysql"
    service mysql start 
    echo "database started"
    echo "executing script"
    mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
                           CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;\
                           GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '$MYSQL_USER'@'%'; \
                           ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; \
                           FLUSH PRIVILEGES;"
    echo "script executed"
    echo "killing process"
    kill -s TERM $(cat /run/mysqld/mysqld.pid) 
    sleep 7
    echo "process killed"
    exec "$@"
fi

# service mysql  \
#     && echo "database started" && mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
#                           CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;\
#                           GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '$MYSQL_USER'@'%'; \
#                           ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; \
#                           FLUSH PRIVILEGES;" && echo "script executed" && kill -s TERM $(cat /run/mysqld/mysqld.pid) &&  echo "process killed" && exec "$@"
