#!/bin/bash

docker run \
    --name mysql-server \
    --restart always \
    -e MYSQL_ROOT_PASSWORD=pass \
    -v /data/mysql:/var/lib/mysql \
    -p 3306:3306 \
    -d \
    mariadb:10.4.18
apt-get install -y mysql-client