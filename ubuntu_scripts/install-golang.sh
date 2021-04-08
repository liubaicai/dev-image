#!/usr/bin/bash

apt-get install -y software-properties-common
add-apt-repository ppa:longsleep/golang-backports -y
apt-get install -y golang-go
