FROM alpine:latest
# adding nignx 
RUN apk update && apk add nginx
# keep the container running as a daemon
# creating the config file
COPY nginx.conf /home
COPY index.html /home

CMD ["nginx", "-g", "daemon off;", "-c", "/home/nginx.conf"]

