#!/bin/bash

docker run \
    --name redis-server \
    --restart always \
    -p 6379:6379 \
    -d \
    redis:6.0.12-alpine3.13