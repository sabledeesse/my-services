FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY grafana.ini /etc/grafana/
COPY jsons/* /var/lib/grafana/dashboards/
COPY datasource.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml

EXPOSE	3000

ENTRYPOINT ["/usr/sbin/grafana-server", "--homepath=/usr/share/grafana"]