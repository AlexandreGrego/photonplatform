#!/bin/bash
set -x #echo on

#tenant variables
tenant1=orgADevs
tenant2=orgBDevs

#project variables
project1=orgADept1
project2=orgADept2
project3=orgBDept1
project4=orgBDept2

#image variables
k8s="images/kubernetes-1.5.1-pc-1.1.1-dfea3bb.ova"
harbor="images/harbor-0.4.1-pc-1.1.1-dfea3bb.ova"

#import images

#import kubernetes image
photon image create "$k8s" -n kubernetes -i EAGER
#import harbor image
photon image create "$harbor" -n harbor -i ON_DEMAND
