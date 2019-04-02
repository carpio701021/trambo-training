FROM nginx:latest
MAINTAINER Javier Carpio <example@example.com>
LABEL Description="Nginx proxy for this app"

ENV APP_ENDPOINT=pythonflask:5000
ENV STATIC_ENDPOINT=static-server:80

COPY nginx.conf /etc/nginx/nginx.conf

CMD /bin/bash -c "sed -i \"s/@@APP_ENDPOINT@@/${APP_ENDPOINT}/\" /etc/nginx/nginx.conf && sed -i \"s/@@STATIC_ENDPOINT@@/${STATIC_ENDPOINT}/\" /etc/nginx/nginx.conf && nginx -g 'daemon off;'" 

