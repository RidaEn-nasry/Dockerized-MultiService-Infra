FROM debian:buster

# cmd is passed to entrypoint as argument 
ARG MYSQL_NAME
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get update -y && apt-get upgrade -y && apt-get install wget mariadb-server procps -y
COPY ./tools/init.sh /tmp/init.sh
COPY ./tools/createdb.sql /tmp/createdb.sql
RUN chmod +x /tmp/init.sh
EXPOSE 3306
RUN sed -i 's/^bind-address\s*=.*/bind-address=0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && chmod +x /usr/bin/dumb-init
ENTRYPOINT [ "sh", "/tmp/init.sh" ]
CMD [ "mysqld_safe" , "--verbose"]
# CMD [ "sh", "/tmp/init.sh"]
