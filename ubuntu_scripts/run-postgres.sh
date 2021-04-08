#!/bin/bash

docker run \
    --name postgres-server \
    --restart always \
    -e POSTGRES_USER=srv \
    -e POSTGRES_PASSWORD=pass \
    -v /data/postgres:/var/lib/postgresql/data \
    -p 5432:5432 \
    -d \
    postgres:12.6-alpine
apt-get install -y postgresql-client