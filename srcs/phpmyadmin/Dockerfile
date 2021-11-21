FROM alpine

RUN apk add --no-cache bash

RUN apk update \
&& apk add nginx openrc \
wget php7 php7-fpm php7-mcrypt php7-opcache php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-session php7-sqlite3 php7-apcu php7-zlib php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-mbstring php7-pdo_dblib php7-curl php7-ctype

RUN adduser -D -g 'www' www

# since alpine doesn't have this folder, create it to run nginx (or PID missing prob)
RUN mkdir -p /run/nginx

RUN mkdir /www \
&& chown -R www:www /var/lib/nginx\
&& chown -R www:www /www

RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz \
&& tar xzf phpMyAdmin-5.0.2-all-languages.tar.gz \
&& mv /phpMyAdmin-5.0.2-all-languages /phpmyadmin \
&& mv /phpmyadmin /www \
&& rm phpMyAdmin-5.0.2-all-languages.tar.gz

COPY nginx.conf /etc/nginx/

COPY init_phpmyadmin.sh .

COPY config.inc.php /www/phpmyadmin
RUN chmod 644 /www/phpmyadmin/config.inc.php \
&& chmod 755 /www/phpmyadmin/

COPY probe.sh .

EXPOSE 5000

CMD ["bash", "init_phpmyadmin.sh"]
