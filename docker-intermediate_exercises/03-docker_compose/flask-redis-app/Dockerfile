FROM gliderlabs/alpine:latest
MAINTAINER Javier Carpio <example@example.com>
LABEL Description="Simple flask/redis app"

ADD . /app
WORKDIR /app
RUN apk-install python \
    python-dev \
    py-pip &&\
    pip install -r requirements.txt

ENV REDIS_HOST redis
ENV REDIS_PORT 6379

CMD ["python", "app.py"]