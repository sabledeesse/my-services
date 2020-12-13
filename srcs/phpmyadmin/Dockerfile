FROM alpine:latest

RUN	apk update && \
	apk add wget bash nginx openrc \
	php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl \
	php7-mbstring php7-json php7-session supervisor

RUN adduser -D -g 'www' www && \
    mkdir /www && \
    chown -R www:www /www && \
    mkdir -p /run/nginx

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
    tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz -C /www/. && \
    rm -f ./phpMyAdmin-5.0.4-all-languages.tar.gz && \
    mv /www/phpMyAdmin-5.0.4-all-languages /www/phpmyadmin && \
	rm -rf /var/cache/apk/*

COPY config.inc.php ./ \
	 nginx.conf  ./ \
	 start.sh ./ \
	 supervisord.conf ./

RUN mv config.inc.php /www/phpmyadmin && \
	chown -R www:www /www/phpmyadmin && \
    mv nginx.conf /etc/nginx/conf.d/

EXPOSE 5000

CMD bash start.sh




