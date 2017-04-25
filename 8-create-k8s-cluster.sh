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
photon -n service create -n $name -k KUBERNETES --number-of-masters $masternum --container-network "$containernet" --number-of-etcds $etcdnum -c $workers -v $flavor --ssh-key $sshkey --registry-ca-cert $registryca
