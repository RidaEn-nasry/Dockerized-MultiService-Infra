FROM debian:buster

ARG MYSQL_NAME
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get update -y && apt-get upgrade -y && apt-get install wget mariadb-server  -y

# we call mysql and not mariadb. because MariaDB
# is a fork of MySQL, even though they are different the name of the
# commands we invoke and folders we use are as if we were using MySQL

# the folder "/var/run/mysqld" is created to store the socket file for the MySQL 
# daemon. This is because the MySQL daemon needs to have a place to store its socket file, 
# which is used by client programs to communicate with the daemon. The socket file is created in this folder,
RUN mkdir -p /var/run/mysqld

# give permision to socket to ensure that the MySQL server process has the necessary permissions to write
# to the directory and create the necessary socket files for client-server communication.
RUN chown -R mysql:mysql /var/run/mysqld

#The syntax 'something@something' is used to specify a MySQL user and their associated host
#In MySQL, a user is identified by a combination of their username and the host they are connecting from.
# so in this context root can connect only from localhost and username can connect from any host.
# flush privileges is used to reload the grant tables and put into effect the changes we made.

RUN service mysql start && mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;\
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';\
    GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
    FLUSH PRIVILEGES;"

EXPOSE 3306

# COPY ./conf/mariadb-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i 's/^bind-address\s*=.*/bind-address=0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf


RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && chmod +x /usr/bin/dumb-init

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD ["mysqld_safe", "--verbose"]



