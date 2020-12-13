FROM alpine:latest

RUN	apk update && \
    apk add openssl && \
    apk add vsftpd && \
    apk add bash

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN echo -e "clown\nclown" | adduser ftp_clown -h /clown_dir;
RUN chown ftp_clown:ftp_clown /clown_dir
RUN openssl req -x509 -newkey rsa:4096 -sha256 -utf8 -days 365 -nodes \
    -keyout /etc/ssl/private/vsftpd.key \
    -out /etc/ssl/certs/vsftpd.crt \ 
    -subj '/CN=localhost'

COPY start.sh ./

EXPOSE 20 21 30000

CMD bash start.sh