ARG MYSQL_NAME
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG WP_USER
ARG WP_USER_EMAIL
ARG WP_USER_PWD

FROM debian:buster 
RUN apt-get update -y && apt-get upgrade -y && apt-get install wget php-fpm php-mysql curl -y

RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
RUN chmod +x /usr/bin/dumb-init

COPY ./tools/init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh

EXPOSE 9000

# ENTRYPOINT [ "sh", "/tmp/init.sh" ]

# CMD [ "php-fpm7.3", "-F" ]


CMD [ "sh", "/tmp/init.sh"]