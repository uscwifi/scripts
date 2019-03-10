#!/bin/bash

curl -sSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | apt-key add -
add-apt-repository  "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu/ $(lsb_release -cs) stable"
apt update -y

apt install docker-ce -y

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
