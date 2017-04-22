#!/bin/bash
set -x #echo on

#read in global vars
. ./globalvars.sh

#create two tenants and assign resource tickets (quota's) to each tenant

##total your cloud resources and divide by 2 for quota variables##
##this will create two tenants an assign half the cloud resources to each tenant##
#quota variables
cpu=200
mem=512
vm=120
vmcost=300
persistentdisk=100
persistentddiskcapacity=2000
ephemeraldisk=100
ephemeraldiskcapacity=2000
floatingips=1000

#create tenant 1
photon -n tenant create $tenant1
#create tenant 2
photon -n tenant create $tenant2

#create quota's and assign them to tenants
photon -n tenant quota set $tenant1 -l "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, vm.cost $vmcost COUNT, persistent-disk.count $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB, sdn.floatingip.size $floatingips COUNT"
photon -n tenant quota set $tenant2 -l "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, vm.cost $vmcost COUNT, persistent-disk.count $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB, sdn.floatingip.size $floatingips COUNT"
