#!/bin/bash 


images='kube-apiserver:v1.13.2 kube-controller-manager:v1.13.2 kube-proxy:v1.13.2 kube-scheduler:v1.13.2 coredns:1.2.6 etcd:3.2.24 pause:3.1 flannel:v0.10.0-amd64'
path="registry.cn-shanghai.aliyuncs.com/kdc/"

for i in ${images}
    do 
	docker pull ${path}${i}
        docker tag ${path}${i} k8s.gcr.io/${i}
	docker image rm ${path}${i}
	if [ $i = 'flannel:v0.10.0-amd64' ];then
            docker tag k8s.gcr.io/${i} quay.io/coreos/flannel:v0.10.0-amd64
            docker image rm k8s.gcr.io/${i}
        fi
    done

#flannel
#docker pull ${path}flannel:v0.10.0-amd64
#docker tag ${path}flannel:v0.10.0-amd64








#docker tag k8s.gcr.io/kube-apiserver:v1.13.2 registry.cn-shanghai.aliyuncs.com/kdc/kube-apiserver:v1.13.2
#docker push registry.cn-shanghai.aliyuncs.com/kdc/kube-apiserver:v1.13.2
#docker tag k8s.gcr.io/kube-controller-manager:v1.13.2 registry.cn-shanghai.aliyuncs.com/kdc/kube-controller-manager:v1.13.2
#docker push registry.cn-shanghai.aliyuncs.com/kdc/kube-controller-manager:v1.13.2
#
#docker tag k8s.gcr.io/kube-proxy:v1.13.2 registry.cn-shanghai.aliyuncs.com/kdc/kube-proxy:v1.13.2
#docker push registry.cn-shanghai.aliyuncs.com/kdc/kube-proxy:v1.13.2
#
#docker tag k8s.gcr.io/kube-scheduler:v1.13.2 registry.cn-shanghai.aliyuncs.com/kdc/kube-scheduler:v1.13.2
#docker push registry.cn-shanghai.aliyuncs.com/kdc/kube-scheduler:v1.13.2
#
#docker tag k8s.gcr.io/coredns:1.2.6 registry.cn-shanghai.aliyuncs.com/kdc/coredns:1.2.6
#docker push registry.cn-shanghai.aliyuncs.com/kdc/coredns:1.2.6
#
#docker tag k8s.gcr.io/etcd:3.2.24 registry.cn-shanghai.aliyuncs.com/kdc/etcd:3.2.24
#docker push registry.cn-shanghai.aliyuncs.com/kdc/etcd:3.2.24
#
#docker tag k8s.gcr.io/pause:3.1 registry.cn-shanghai.aliyuncs.com/kdc/pause:3.1
#docker push registry.cn-shanghai.aliyuncs.com/kdc/pause:3.1
#
#docker tag quay.io/coreos/flannel:v0.10.0-amd64 registry.cn-shanghai.aliyuncs.com/kdc/flannel:v0.10.0-amd64
#docker push registry.cn-shanghai.aliyuncs.com/kdc/flannel:v0.10.0-amd64
