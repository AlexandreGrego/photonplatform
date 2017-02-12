#!/bin/bash
set -x #echo on

#variables
pass="VMware1!"
name=habor01
dns=192.168.110.10
gw=192.168.110.1
mask=255.255.255.0
masterip=192.168.110.25
flavor=medium-vm

#create harbor registry
photon cluster create -n $name -k HARBOR --dns $dns --gateway $gw --netmask $mask --master-ip $masterip -v $flavor --admin-password $pass
