#!/bin/bash

sudo -s
apt-get update
apt  install awscli -y

apt-get -y install net-tools nginx
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html

# echo "Hello, World" > index.html
# nohup busybox httpd -f -p 8080 &

apt install mysql-client -y