#!/bin/bash
set -x #echo on

#read in global vars
. ./globalvars.sh

#variables
name=k8cluster01
dns=192.168.110.10
gw=172.16.10.1
mask=255.255.255.0
masterip=172.16.10.25
etcdip=172.16.10.26
containernet=10.2.0.0/16
workers=1
flavor=medium-vm
sshkey="../.ssh/id_rsa.pub"
registryca=harbor01-cert.crt

photon tenant set $tenant1
photon project set $project1

#create k8s cluster
photon -n cluster create -n $name -k KUBERNETES --dns $dns --gateway $gw --netmask $mask --master-ip $masterip --container-network "$containernet" --etcd1 $etcdip -c $workers -v $flavor --ssh-key $sshkey #--registry-ca-cert $registryca
