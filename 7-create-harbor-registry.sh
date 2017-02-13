#!/bin/bash
set -x #echo on

#tenant variables
tenant1=orgADevs

#project variables
project1=orgADept1

#variables
pass="VMware1!"
name=habor01
dns=192.168.110.10
gw=192.168.110.1
mask=255.255.255.0
masterip=192.168.110.20
flavor=medium-vm

photon tenant set $tenant1
photon project set $orgADept1

#create harbor registry
photon cluster create -n $name -k HARBOR --dns $dns --gateway $gw --netmask $mask --master-ip $masterip -v $flavor --admin-password $pass
