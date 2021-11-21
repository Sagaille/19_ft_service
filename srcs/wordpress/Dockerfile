FROM alpine
#root
#RUN apk add --no-cache su-exec

ADD init_wp.sh .

RUN apk update \
&& apk add nginx openrc

RUN apk add --no-cache bash

RUN apk add php7 php7-fpm php7-mcrypt php7-opcache php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-session php7-sqlite3 php7-apcu php7-zlib php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-mbstring php7-pdo_dblib php7-curl php7-ctype

RUN adduser -D -g 'www' www

# since apk add nginx doesn't place this folder, create it to run nginx (or PID missing prob)
RUN mkdir -p /run/nginx

RUN mkdir /www \
&& chown -R www:www /var/lib/nginx\
&& chown -R www:www /www

RUN wget https://wordpress.org/latest.tar.gz -P /tmp\
&& tar xzf /tmp/latest.tar.gz -C /www \
&& rm /tmp/latest.tar.gz

COPY nginx.conf /etc/nginx/
COPY probe.sh .

COPY /wp-config.php /www/wordpress/

EXPOSE 5050

CMD ["bash", "init_wp.sh"]
