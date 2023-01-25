FROM debian:buster

ARG MYSQL_NAME
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get update -y && apt-get upgrade -y && apt-get install wget mariadb-server  -y

# start the mysql service
# RUN sed -i '28s/.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf



# we call mysql and not mariadb. because MariaDB
# is a fork of MySQL, even though they are different the name of the
# commands we invoke and folders we use are as if we were using MySQL

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

RUN service mysql start && mysql -u root -e "\
CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;\
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'\
GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
FLUSH PRIVILEGES;"

EXPOSE 3306


COPY ./conf/mariadb-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && chmod +x /usr/bin/dumb-init

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]
