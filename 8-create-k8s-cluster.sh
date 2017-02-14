#!/bin/bash
set -x #echo on

#tenant variables
tenant1=orgADevs

#project variables
project1=orgADept1

photon tenant set $tenant1
photon project set $orgADept1
#variables
name=k8cluster01
dns=192.168.110.10
gw=192.168.100.1
mask=255.255.255.0
masterip=192.168.100.25
etcdip=192.168.100.26
containernet=10.2.0.0/16
workers=1
flavor=medium-vm
sshkey="../.ssh/id_rsa.pub"
registryca=ca_harbor.crt

photon tenant set $tenant1
photon project set $project1

#create k8s cluster
photon cluster create -n $name -k KUBERNETES --dns $dns --gateway $gw --netmask $mask --master-ip $masterip --container-network "$containernet" --etcd1 $etcdip -c $workers -v $flavor --ssh-key $sshkey --registry-ca-cert $registryca
