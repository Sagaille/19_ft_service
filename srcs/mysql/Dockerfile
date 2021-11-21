FROM alpine

RUN apk update

RUN apk add --no-cache bash

RUN apk add mariadb mariadb-client openrc

RUN mkdir /utils
RUN mkdir -p /var/run/mysqld /var/lib/mysql /run/mysqld
RUN chmod +x /var/run/mysqld

COPY init_db.sh .
RUN chmod +x init_db.sh
COPY my.cnf /etc/mysql/
RUN chmod 700 /etc/mysql/my.cnf

COPY probe.sh .

EXPOSE 3306

CMD ["bash","init_db.sh"]
