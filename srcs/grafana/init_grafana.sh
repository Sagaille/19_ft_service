#openrc
#touch /run/openrc/softlevel
#homepath to dir so the .conf can be found
exec su-exec grafana /grafana-7.3.3/bin/grafana-server --homepath=/grafana-7.3.3/
