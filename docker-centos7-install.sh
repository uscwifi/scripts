#!/bin/bash
set -e

yum install -y wget
wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo -O /etc/yum.repos.d/docker-ce.repo

yum clean all
yum makecache
yum install -y docker-ce

#镜像加速
mkdir -p /etc/docker/
tee /etc/docker/daemon.json <<EOF
{
  "registry-mirrors": ["https://7f28zkr3.mirror.aliyuncs.com"]
}
EOF
systemctl daemon-reload 
systemctl restart docker
systemctl enable docker
