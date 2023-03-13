FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y  && apt-get install nginx openssl wget -y

# creating a self-signed certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=ren-nasr.1337.ma"

# copying our custom nginx config file
COPY ./conf/custom-nginx.conf /etc/nginx/custom-nginx.conf

# creating the folder for the website , (not necessary but it's a standard to have webpages in /var/www/html)
RUN mkdir -p /var/www/html/

#give the permission to the folder
RUN chmod -R 755 /var/www/html/

COPY ./tools/index.html /var/www/html/index.html

EXPOSE 443

CMD ["nginx", "-c", "/etc/nginx/custom-nginx.conf", "-g", "daemon off;"]
