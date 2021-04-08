#!/usr/bin/bash

apt-get install -y libpcre3 libpcre3-dev gcc make zlib1g-dev

curl -fsSLO --compressed "http://nginx.org/download/nginx-1.20.2.tar.gz"
tar -zxvf "nginx-1.20.2.tar.gz"
cd "nginx-1.20.2/"
./configure
make
make install
cd ..
rm "nginx-1.20.2.tar.gz" 
rm -rf "nginx-1.20.2/"

ln -s /usr/local/nginx/sbin/nginx /usr/local/bin/nginx

nginx -V

nginx
