#!/bin/bash

sudo -s
apt-get update
apt  install awscli -y


echo "Hello, World" > index.html
nohup busybox httpd -f -p 8080 &

apt install mysql-client