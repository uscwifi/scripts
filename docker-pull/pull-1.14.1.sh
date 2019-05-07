registry="k8s.gcr.io"
path="registry.cn-shanghai.aliyuncs.com/kdc/"
kube_tag="v1.14.1"
images="kube-proxy:${kube_tag} kube-apiserver:${kube_tag} kube-controller-manager:${kube_tag} kube-scheduler:${kube_tag} coredns:1.3.1 etcd:3.3.10 pause:3.1 flannel:v0.11.0-amd64"

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
