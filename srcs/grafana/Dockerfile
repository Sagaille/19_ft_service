FROM alpine

RUN apk update

RUN apk add bash openrc su-exec libc6-compat

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.3.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.3.3.linux-amd64.tar.gz
RUN mkdir /grafana-7.3.3/dashboard/

COPY init_grafana.sh .
COPY datasources.yaml /grafana-7.3.3/conf/provisioning/datasources/influxdb.yaml
COPY grafana-dashboard-provider.yaml /grafana-7.3.3/conf/provisioning/dashboards/dashboards.yaml
COPY /dashboards/* /grafana-7.3.3/dashboard/


EXPOSE 3000

CMD ["bash","init_grafana.sh"]

