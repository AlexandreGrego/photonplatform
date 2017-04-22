#!/bin/bash
set -x #echo on

#read in global vars
. ./globalvars.sh

#variables
name1=tenant-net
portgroup1="Tenant Network"
desc1="Tenant Network"
type=NAT

photon tenant set $tenant1
photon project set $project1
#create tenant network and copy uuid of this network to set the default-network
#uuid=$(photon network create --name $name1 --portgroups "$portgroup1" --description "$desc1" | awk '{print $7}')
rtruuid=$(photon router list | grep default | awk '{print $1}')
photon -n subnet create -n $name1 -i 172.16.10.0/24 -d "$desc1" -t $type -r $rtruuid
netuuid=$(photon subnet list | grep $name1 | awk '{print $1}')
#set tenant network as the default network
photon -n subnet set-default $netuuid 
