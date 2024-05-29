#!/bin/bash

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

chown -R mysql:mysql /var/lib/mysql/

service mariadb start
mariadb <<-EOF
CREATE DATABASE $DB_NAME;
CREATE USER '$USER' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER'@'%';
FLUSH PRIVILEGES;
EOF

sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb stop

fi
exec "$@"