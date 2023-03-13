


#!/bin/sh

# if database already exis only run exec "$@"
if [ -d /var/lib/mysql/$MYSQL_NAME ]; then
    echo "database already exists"
    exec "$@" 
else
    
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
    pid=$(ps -ef | grep /usr/sbin/mysqld | grep -v grep | awk '{print $2}')
    if [ -z "$pid" ]; then
        echo "no pid found"
    else
        echo "pid found"
        kill -s TERM $pid
    fi
    sleep 7
    echo "process killed"
    # exec mysqld_safe
    exec "$@"
fi

