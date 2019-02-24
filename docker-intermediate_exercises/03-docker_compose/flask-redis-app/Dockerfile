FROM gliderlabs/alpine:latest
MAINTAINER Javier Carpio <example@example.com>
LABEL Description="Simple flask/redis app"

ADD . /app
WORKDIR /app
RUN apk-install python \
    python-dev \
    py-pip &&\
    pip install -r requirements.txt
CMD ["python", "app.py"]