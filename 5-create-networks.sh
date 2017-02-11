#!/bin/bash
set -x #echo on

#variables
name1=tenant-net
portgroup1="Tenant Network"
desc1="Tenant Network"

#create tenant network and copy uuid of this network to set the default-network
uuid=$(photon network create --name $name1 --portgroups "portgroup1" --description "$desc1" | awk '{print $7}')

#set tenant network as the default network
echo y | photon network set-default $uuid
