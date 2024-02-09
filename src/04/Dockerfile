FROM nginx

WORKDIR /home/

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./server.c /home/server.c
COPY ./start.sh /home/start.sh

RUN apt-get update; \
    apt-get install -y gcc libfcgi-dev lighttpd; \

chmod +x /home/start.sh
ENTRYPOINT bash start.sh