#!/bin/bash

sudo docker network create es-network
sudo docker run \
    -d \
    --restart always \
    --name elasticsearch \
    --net es-network \
    -p 9200:9200 \
    -p 9300:9300 \
    -e "discovery.type=single-node" \
    elasticsearch:7.12.0
sudo docker run \
    -d \
    --restart always \
    --name elasticsearch-kibana \
    --net es-network \
    -p 5601:5601 \
    kibana:7.12.0