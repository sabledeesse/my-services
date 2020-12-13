FROM alpine:latest

RUN apk update && \
    apk add mysql mysql-client bash openrc

COPY ./my.cnf /etc/mysql/my.cnf
COPY ./create_db.sql ./
COPY ./wordpress.sql ./
COPY ./start.sh ./

VOLUME    ["/sys/fs/cgroup"]

EXPOSE 3306
CMD bash start.sh