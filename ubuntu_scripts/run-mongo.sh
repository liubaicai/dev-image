#!/bin/bash

docker run \
    --restart always \
    -v /data/mongodb:/data/db \
    -p 27017:27017 \
    -d \
    mongo:4.4.5
apt-get install -y mongodb-clients