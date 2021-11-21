FROM alpine:latest

RUN apk update \
&& apk add nginx openssl bash openssh

RUN adduser -D -g 'www' www

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com" \
-keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt

RUN mkdir /www \
&& chown -R www:www /var/lib/nginx\
&& chown -R www:www /www

# since apk add nginx doesn't place this folder, create it to run nginx (or PID missing prob)
RUN mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/
COPY nginx.conf /etc/nginx/conf.d/

COPY index.html /www/index.html

RUN mkdir /utils

ADD /launch.sh /utils

EXPOSE 80 443

CMD ["bash", "utils/launch.sh"]
