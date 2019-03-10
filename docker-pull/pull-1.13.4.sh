registry="k8s.gcr.io"
path="registry.cn-shanghai.aliyuncs.com/kdc/"
kube_tag="v1.13.4"
images="kube-proxy:${kube_tag} kube-apiserver:${kube_tag} kube-controller-manager:${kube_tag} kube-scheduler:${kube_tag} coredns:1.2.6 etcd:3.2.24 pause:3.1 flannel:v0.11.0-amd64"

for i in ${images}
do
    if [ ${i} = 'flannel:v0.11.0-amd64' ];then
      registry="quay.io/coreos"
    fi
    docker pull ${path}$i
    docker tag ${path}$i ${registry}/${i}
    docker image rm ${path}$i
    registry="k8s.gcr.io"
done
