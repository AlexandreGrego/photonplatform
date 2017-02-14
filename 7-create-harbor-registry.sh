#!/bin/bash
set -x #echo on

#tenant variables
tenant1=orgADevs

#project variables
project1=orgADept1

#variables
pass="VMware1!"
name=harbor01
dns=192.168.110.10
gw=192.168.110.1
mask=255.255.255.0
masterip=192.168.110.20
flavor=medium-vm
sshkey="../.ssh/id_rsa.pub"

photon tenant set $tenant1
photon project set $project1

#create harbor registry
echo y | photon cluster create -n $name -k HARBOR --dns $dns --gateway $gw --netmask $mask --master-ip $masterip -v $flavor --admin-password $pass --ssh-key "$sshkey"

#save certificate with openssl s_client
openssl s_client -showcerts -connect $masterip:443 </dev/null 2>/dev/null | sed -n '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/p' | grep -m1 -B 40 -- '-----END CERTIFICATE-----'  > $name_ca_harbor.crt

#harboruuid=$(photon cluster list | grep $name | awk '{print $1}')
#show the harbor deployment and save the certificate
#photon cluster show $harboruuid
