FROM debian:buster
# cmd is passed to entrypoint as argument 
ARG MYSQL_NAME
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server procps -y
COPY ./tools/init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh
EXPOSE 3306
RUN sed -i 's/^bind-address\s*=.*/bind-address=0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT [ "sh", "/tmp/init.sh" ]
CMD [ "mysqld_safe" , "--verbose"]
