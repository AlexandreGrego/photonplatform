#!/bin/bash
set -x #echo on

#read in global vars
. ./globalvars.sh

#image variables
k8s="images/kubernetes-1.6.0-pc-1.2-dd9d360.ova"
harbor="images/harbor-0.4.1-pc-1.2-dd9d360.ova"
docker="images/debian-8.2.vmdk"

#import images

#import kubernetes image
photon -n image create "$k8s" -n kubernetes -i EAGER
#import harbor image
#photon -n image create "$harbor" -n harbor -i ON_DEMAND
#import docker-machine image
#photon -n image create "$docker" -n "docker-machine" -i EAGER
