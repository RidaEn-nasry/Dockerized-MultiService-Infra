FROM alpine:latest
# adding nignx 
RUN apk update && apk add nginx
WORKDIR /home


# keep the container running as a daemon
# creating the config file
# COPY ./conf/nginx.conf /home
# COPY ./conf/index.html /home

EXPOSE 80

CMD ["nginx", "-g", "daemon off;", "-c", "/home/nginx.conf"]

