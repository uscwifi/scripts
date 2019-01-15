#!/bin/bash

#images='k8s.gcr.io/kube-apiserver:v1.13.2 k8s.gcr.io/kube-controller-manager:v1.13.2 k8s.gcr.io/kube-proxy:v1.13.2 k8s.gcr.io/kube-scheduler:v1.13.2 k8s.gcr.io/coredns:1.2.6 k8s.gcr.io/etcd:3.2.24 quay.io/coreos/flannel:v0.10.0-amd64 k8s.gcr.io/pause:3.1'
#for i in ${images}
#    do 
#        docker tag $i registry.cn-shanghai.aliyuncs.com/kdc/:
#    done

docker tag k8s.gcr.io/kube-apiserver:v1.13.2 registry.cn-shanghai.aliyuncs.com/kdc/kube-apiserver:v1.13.2
docker push registry.cn-shanghai.aliyuncs.com/kdc/kube-apiserver:v1.13.2
docker tag k8s.gcr.io/kube-controller-manager:v1.13.2 registry.cn-shanghai.aliyuncs.com/kdc/kube-controller-manager:v1.13.2
docker push registry.cn-shanghai.aliyuncs.com/kdc/kube-controller-manager:v1.13.2

docker tag k8s.gcr.io/kube-proxy:v1.13.2 registry.cn-shanghai.aliyuncs.com/kdc/kube-proxy:v1.13.2
docker push registry.cn-shanghai.aliyuncs.com/kdc/kube-proxy:v1.13.2

docker tag k8s.gcr.io/kube-scheduler:v1.13.2 registry.cn-shanghai.aliyuncs.com/kdc/kube-scheduler:v1.13.2
docker push registry.cn-shanghai.aliyuncs.com/kdc/kube-scheduler:v1.13.2

docker tag k8s.gcr.io/coredns:1.2.6 registry.cn-shanghai.aliyuncs.com/kdc/coredns:1.2.6
docker push registry.cn-shanghai.aliyuncs.com/kdc/coredns:1.2.6

docker tag k8s.gcr.io/etcd:3.2.24 registry.cn-shanghai.aliyuncs.com/kdc/etcd:3.2.24
docker push registry.cn-shanghai.aliyuncs.com/kdc/etcd:3.2.24

docker tag k8s.gcr.io/pause:3.1 registry.cn-shanghai.aliyuncs.com/kdc/pause:3.1
docker push registry.cn-shanghai.aliyuncs.com/kdc/pause:3.1

docker tag quay.io/coreos/flannel:v0.10.0-amd64 registry.cn-shanghai.aliyuncs.com/kdc/flannel:v0.10.0-amd64
docker push registry.cn-shanghai.aliyuncs.com/kdc/flannel:v0.10.0-amd64
