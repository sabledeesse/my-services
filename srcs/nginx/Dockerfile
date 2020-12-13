FROM alpine:latest

RUN	apk update && \
    apk add openrc --no-cache && \
    apk add bash && \
    apk add nginx openssl openssh supervisor

RUN echo -e "tunnamab\ntunnamab" | adduser tunnamab
RUN mkdir -p /run/nginx

RUN openssl req -x509 -newkey rsa:4096 -sha256 -utf8 -days 365 -nodes \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \ 
    -subj '/CN=localhost'

RUN  rm -f /etc/nginx/conf.d/*.conf
COPY nginx.conf /etc/nginx/conf.d/
COPY index.html /var/lib/nginx/html/
COPY ng_start.sh .
COPY supervisord.conf ./

EXPOSE 80 443 22

#VOLUME    ["/sys/fs/cgroup"]

CMD bash ng_start.sh