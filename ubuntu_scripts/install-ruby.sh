#!/usr/bin/bash

apt-get install -y software-properties-common
apt-add-repository ppa:brightbox/ruby-ng -y
apt-get install -y gcc make libssl-dev zlib1g-dev libyaml-dev libgdbm-dev \
    libqdbm-dev libreadline-dev libncurses5-dev libpq-dev libffi-dev \
    ruby2.7 ruby2.7-dev