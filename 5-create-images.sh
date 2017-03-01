#!/bin/bash
set -x #echo on

#read in global vars
. ./globalvars.sh

#image variables
k8s="images/kubernetes-1.5.1-pc-1.1.1-dfea3bb.ova"
harbor="images/harbor-0.4.1-pc-1.1.1-dfea3bb.ova"
docker="images/debian-8.2.vmdk"

#import images

#import kubernetes image
photon image create "$k8s" -n kubernetes -i EAGER
#import harbor image
photon image create "$harbor" -n harbor -i ON_DEMAND
#import docker-machine image
photon image create "$docker" -n "docker-machine" -i EAGER
