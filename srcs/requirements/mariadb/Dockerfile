FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install wget mariadb-server  -y
# listen on all interfaces


# start the mysql service
RUN sed -i '28s/.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# COPY ./tools/init.sql /tmp/init.sql
# RUN chmod 777 /tmp/init.sql 


COPY ./tools/init.sh /tmp/init.sh
RUN chmod 777 /tmp/init.sh && /tmp/init.sh 
# show content of /home/init_mariadb.sql
# RUN echo "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;\n\
#     CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASS';\n\
#     GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';\n\
#     ALTER USER \'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASS';\n\
#     FLUSH PRIVILEGES;" > /home/init_mariadb.sql

RUN cat /home/init_mariadb.sql
RUN mysql_install_db
RUN service mysql start && mysql < /home/init_mariadb.sql
RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
RUN chmod +x /usr/bin/dumb-init

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD ["mysqld_safe"]

# initilizaing using mysql_install_db 
#  