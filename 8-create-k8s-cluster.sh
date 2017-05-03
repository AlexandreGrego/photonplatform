#!/bin/bash
set -x #echo on

#read in global vars
. ./globalvars.sh

#variables
name=k8cluster01
masternum=1
etcdnum=1
containernet=10.2.0.0/16
workers=1
flavor=medium-vm
sshkey="../.ssh/id_rsa.pub"
registryca=harbor.crt

photon tenant set $tenant1
photon project set $project1

#create k8s cluster
echo y | photon service create -n $name -k KUBERNETES --number-of-masters $masternum --container-network "$containernet" --number-of-etcds $etcdnum -c $workers -v $flavor --ssh-key $sshkey --registry-ca-cert $registryca

#Variables
user=Administrator
pass="VMware1!"
tenant=photon.local
rm -f pc_login_info

clustername="k8cluster01"
clusterid=$(photon cluster list |grep "$clustername" |awk '{print $1}')

#Create login File
printf "$user@$tenant\n$pass\n" >>pc_login_info

#Find Master IP of Cluster
ip=$(photon cluster show $clusterid |grep " master_ips" |sed -r 's/.* master_ips:([^ ]+).*/\1/'i)

#Copy File to Master

scp  -o StrictHostKeyChecking=no -i /root/.ssh/id_rsa pc_login_info root@$ip:/etc/kubernetes/pc_login_info

