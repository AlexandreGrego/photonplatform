#!/bin/bash
set -x #echo on

#tenants
tenant1=orgADevs
tenant2=orgBDevs

#projects
project1=orgADept1
project2=orgADept2
project3=orgBDept1
project4=orgBDept2

#quota's
quota=Gold
cpu=50
mem=128
vm=30
persistentdisk=50
persistentddiskcapacity=250
ephemeraldisk=50
ephemeraldiskcapacity=250

#create projects
photon tenant set $tenant1
echo y | photon project create -n $project1 -r $quota -l "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, persistent-disk $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB"
echo y | photon project create -n $project2 -r $quota -l "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, persistent-disk $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB"

photon tenant set $tenant2
echo y | photon project create -n $project3 -r $quota -l "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, persistent-disk $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB"
echo y | photon project create -n $project4 -r $quota -l "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, persistent-disk $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB"
