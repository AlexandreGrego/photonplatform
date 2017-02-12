#!/bin/bash
set -x #echo on

#create the tenants and assign resource tickets to each tenant

#tenant variables
tenant1=orgADevs
tenant2=orgBDevs

##TOTAL CLOUD RESOURCES (Compute/Storage)##
#quota variables
cpu=100
mem=256
vm=60
persistentdisk=100
persistentddiskcapacity=500
ephemeraldisk=100
ephemeraldiskcapacity=500

#create tenant 1
photon -n tenant create $tenant1
#create tenant 2
photon -n tenant create $tenant2

#create quota's and assign them to tenants
photon tenant set $tenant1
echo y | photon resource-ticket create --name Gold --limits "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, persistent-disk.count $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB"
photon tenant set $tenant2
echo y | photon resource-ticket create --name Gold --limits "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, persistent-disk.count $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB"
