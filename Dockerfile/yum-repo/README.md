# 使用方法：

------

**注意：dockerhub自动构建的话不应该用阿里云源，dockerhub自动构建报错timeout**

## 没有docker环境

先在一个有docker环境的机器将rpm包拷出来

```bash
[root@node1 ~]# docker run -d -p 2019:80 --name yum-repo uscwifi/yum-repo
[root@node1 ~]# docker cp yum-repo:/usr/share/nginx/html/rpms /data/
```

配置http的yum源

```bash
[root@node1 ~]# cat /etc/yum.repos.d/test.repo
[docker]
name=docker
baseurl=file:///data/rpms
enabled=1
gpgcheck=0
```

安装docker和docker-compose

```bash
[root@node1 ~]# yum install docker-ce docker-compose
```

## 已经有docker环境


