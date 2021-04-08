#!/usr/bin/bash

curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
apt-get install -y python3-pip
python3 -m pip install docker-compose

docker -v

service docker start
