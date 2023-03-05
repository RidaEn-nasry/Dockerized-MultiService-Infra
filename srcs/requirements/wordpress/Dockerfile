
FROM alpine:3.17

RUN apk update && apk upgrade

RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
RUN chmod +x /usr/bin/dumb-init

#adding the tesing repository (it contains php7-fpm)
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add php7-fpm php7-mysqli

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
