FROM alpine

RUN apk update
RUN apk add influxdb bash openrc


RUN mkdir -p /etc/influxdb

ADD init_influxdb.sh .
RUN chmod +x init_influxdb.sh

COPY influxdb.conf /etc/influxdb/
RUN chmod +x /etc/influxdb/influxdb.conf

RUN mkdir -p /var/lib/influxdb \
&& chmod +x /var/lib/influxdb

COPY probe.sh .

EXPOSE 8086

CMD ["bash","init_influxdb.sh"]


