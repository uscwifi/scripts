#!/bin/bash

if [ -f /etc/apt/sources.list ]; then
	apt-get update
	apt-get  install curl -y
    curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -
    echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list
    apt-get update
    apt-get install nginx -y
elif [ -f /etc/yum.conf ]; then
	yum install curl -y
	curl -sSL https://raw.githubusercontent.com/uscwifi/yum-repository/master/centos-nginx.repo | tee /etc/yum.repos.d/centos-nginx.repo
    yum install nginx -y    
else
    echo "Your distribution is not supported!"
fi
