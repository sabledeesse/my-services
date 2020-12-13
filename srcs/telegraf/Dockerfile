FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add wget bash

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_static_linux_amd64.tar.gz && \
    tar xf telegraf-1.16.2_static_linux_amd64.tar.gz && \
    mv telegraf-1.16.2 telegraf && \
    rm -f telegraf-1.16.2_static_linux_amd64.tar.gz

ENTRYPOINT ["/telegraf/usr/bin/telegraf"]