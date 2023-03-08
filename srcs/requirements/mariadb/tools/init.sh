


#!/bin/sh


# checking if the db folder exist

/etc/init.d/mysql start \
    && mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
                          CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;\
                          GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '$MYSQL_USER'@'%'; \
                          ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; \
                          FLUSH PRIVILEGES;" && /etc/init.d/mysql stop && echo "$@"

# mysqld_safe 

    # && kill $(ps aux | grep "/usr/sbin/mysqld" | awk '{print $2}' | head -n 1) \


# exec "$@" 



# kill $(ps aux | grep "/usr/sbin/mysqld" | awk '{print $2}' | head -n 1) && service mysql stop


#sleep 3 && kill $(ps aux | grep "/usr/sbin/mysqld" | awk '{print $2}' | head -n 1) && sleep 3 

# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; \
# kill indeed kill the process, get it's pid and kill it first line only 

# kill $(ps aux | grep mysqld | awk '{print $2}')

# run the fourth line alone , you know with root -p 
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;\
# GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';\
# FLUSH PRIVILEGES;" && service mysql stop

# mysqld_safe

