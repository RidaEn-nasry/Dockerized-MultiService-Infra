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


# RUN mkdir -p /var/www/html/
# # owner can read/write/execute, group/others can read/execute
# RUN chmod -R 755 /var/www/html/
# RUN cd /var/www/html/ && rm -rf *
# # remove everything in the default nginx folder


# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# RUN wp core download --allow-root

# RUN cp wp-config-sample.php wp-config.php

# RUN sed -i "s/database_name_here/$MYSQL_NAME/g" wp-config.php
# RUN sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
# RUN sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
# RUN sed -i 's/localhost/db/g' wp-config.php


# RUN cat wp-config.php


# # installs WordPress and sets up the basic configuration for the site. The --url option specifies the URL of the site, --title sets the site's title, --admin_user and --admin_password set the username and password for the site's administrator account, and --admin_email sets the email address for the administrator. The --skip-email flag prevents WP-CLI from sending an email to the administrator with the login details.

# RUN wp core install --url=ren-nasr.42.fr/ --title=hello --admin_user=ren-nasr --admin_password=12346 --admin-email=example@gmail.com --skip-email --allow-root
# RUN wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root

# RUN wp theme install astra --activate --allow-root 


# RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# RUN mkdir /run/php

# RUN /usr/sbin/php-fpm7.3 -F

COPY ./tools/init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "/tmp/init.sh" ]

CMD [ "php-fpm7.3", "-F" ]

