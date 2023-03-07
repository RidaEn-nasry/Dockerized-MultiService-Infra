
FROM debian:buster 
RUN apt-get update -y && apt-get upgrade -y && apt-get install wget php-fpm php-mysql curl -y

RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
RUN chmod +x /usr/bin/dumb-init



RUN mkdir -p /var/www/html/
# owner can read/write/execute, group/others can read/execute
RUN chmod -R 755 /var/www/html/

# remove everything in the default nginx folder
RUN rm -rf /var/www/html/*

# downloa
#adding the tesing repository (it contains php7-fpm)

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
