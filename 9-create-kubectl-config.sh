clustername="k8cluster01"
clusterid=$(photon cluster list |grep "$clustername" |awk '{print $1}')
photon service get-kubectl-auth -u Administrator@photon.local -p 'VMware1!' $clusterid >> kubeauth.sh
chmod +x kubeauth.sh
./kubeauth.sh
rm kubeauth.sh
LBIP=$(photon cluster show "$clusterid" |grep "Kubernetes IP" |awk '{print $3}')
kubectl config set-cluster default-cluster --server https://$LBIP:6443 --insecure-skip-tls-verify=true
kubectl config set-context default-context --cluster default-cluster --user Administrator@photon.local
kubectl config use-context default-context
kubectl get pods --all-namespaces
