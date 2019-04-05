#!/bin/bash
set -e

cat > /etc/yum.repos.d/docker-ce.repo <<EOF
[docker-ce-stable]
name=Docker CE Stable - $basearch
baseurl=https://mirrors.aliyun.com/docker-ce/linux/centos/7/$basearch/stable
enabled=1
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/docker-ce/linux/centos/gpg
EOF

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
