openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
service mariadb restart
#if not can cause problem to create wp db
sleep 5

mysql --user=root << EOF
  CREATE DATABASE wordpress;
  CREATE USER 'root'@'%' IDENTIFIED BY 'root';
  GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
  FLUSH PRIVILEGES;
EOF

tail -f /dev/null
