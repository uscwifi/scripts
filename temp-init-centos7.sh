#!/bin/bash

# 关闭firewalld防火墙
systemctl stop firewalld
# 关闭firewalld防火墙开机启动
systemctl disable firewalld
# 启动iptables防火墙
iptables -F
# 修改时区，保证系统时间准确
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
# 关闭selinus
setenforce 0
# 关闭selinux
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
#修改yum源
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
# bash自动补全
yum install -y bash-completion
# 安装vim，wget
yum install -y wget vim
