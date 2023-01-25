FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y  && apt-get install nginx openssl wget -y

RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
RUN chmod +x /usr/bin/dumb-init
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=ren-nasr.1337.ma"

COPY ./conf/custom-nginx.conf /etc/nginx/custom-nginx.conf
RUN mkdir -p /var/www/html/

#give the permission to the folder
RUN chmod -R 755 /var/www/html/

COPY ./tools/index.html /var/www/html/index.html

EXPOSE 443

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD ["nginx", "-c", "/etc/nginx/custom-nginx.conf", "-g", "daemon off;"]


