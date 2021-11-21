openrc 2> /dev/null
touch /run/openrc/softlevel
service influxdb start 2> /dev/null
sleep 5
influx << EOF
CREATE DATABASE telegraf;
CREATE USER "root" WITH PASSWORD 'root' WITH ALL PRIVILEGES;
EOF
tail -f /dev/null
