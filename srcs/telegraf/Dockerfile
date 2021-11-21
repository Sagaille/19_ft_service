FROM alpine:latest

RUN apk update
RUN apk add curl wget bash openrc

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz
RUN tar -C . -xvf telegraf-1.14.0-static_linux_amd64.tar.gz
RUN chmod +x telegraf/*
RUN cp telegraf/telegraf /usr/bin/
RUN rm -rf *.tar.gz* telegraf


COPY telegraf.conf /etc/telegraf/telegraf.conf
#ADD init_tele.sh .

EXPOSE 8125

CMD /usr/bin/telegraf
