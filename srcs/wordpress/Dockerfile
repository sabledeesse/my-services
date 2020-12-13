FROM alpine:latest

RUN apk update && \
    apk add wget bash && \
    apk add nginx openrc supervisor && \
    apk add php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN adduser -D -g 'www' www && \
    mkdir /www && \
    chown -R www:www /www && \
    mkdir -p /run/nginx

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm latest.tar.gz

COPY wp-config.php ./
COPY start_wp.sh  ./
COPY nginx.conf  ./
COPY supervisord.conf ./

RUN mv wordpress /www/ && \
    mv wp-config.php /www/wordpress && \
    chown -R www:www /www/wordpress && \
    mv nginx.conf /etc/nginx/conf.d/

EXPOSE 5050

CMD bash start_wp.sh
