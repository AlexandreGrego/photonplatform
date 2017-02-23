#!/bin/bash
set -x #echo on

#create the tenants and assign resource tickets to each tenant

#tenant variables
tenant1=orgADevs
tenant2=orgBDevs

##total your cloud resources and divide by 2 for quota variables##
##this will create two tenants an assign half the cloud resources to each tenant##
#quota variables
cpu=200
mem=512
vm=120
persistentdisk=100
persistentddiskcapacity=2000
ephemeraldisk=100
ephemeraldiskcapacity=2000

#create tenant 1
photon -n tenant create $tenant1
#create tenant 2
photon -n tenant create $tenant2

#create quota's and assign them to tenants
photon tenant set $tenant1
echo y | photon resource-ticket create --name Gold --limits "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, persistent-disk.count $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB"
photon tenant set $tenant2
echo y | photon resource-ticket create --name Gold --limits "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, persistent-disk.count $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB"
