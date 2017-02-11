#!/bin/bash
set -x #echo on

#tenants
tenant1=orgADevAdmins
tenant2=orgBDevAdmins

#projects
project1=orgADept1
project2=orgADept2
project3=orgBDept1
project4=orgBDept2

#images
k8s="images/kubernetes-1.4.3-pc-1.1.0-5de1cb7.ova"
harbor="harbor-0.4.1-pc-1.1.0-5de1cb7.ova"

#import images
photon tenant set $tenant1
photon project set $project1
photon image create "$k8s" -n kubernetes -i EAGER
photon image create "$harbor" -n harbor -i ON_DEMAND

