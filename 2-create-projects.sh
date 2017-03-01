#!/bin/bash
set -x #echo on

#read in global vars
. ./globalvars.sh

#quota variables
quota=Gold
cpu=100
mem=256
vm=60
persistentdisk=50
persistentddiskcapacity=1000
ephemeraldisk=50
ephemeraldiskcapacity=1000

#create projects
photon tenant set $tenant1
echo y | photon project create -n $project1 -r $quota -l "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, persistent-disk.count $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB"
echo y | photon project create -n $project2 -r $quota -l "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, persistent-disk.count $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB"

photon tenant set $tenant2
echo y | photon project create -n $project3 -r $quota -l "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, persistent-disk.count $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB"
echo y | photon project create -n $project4 -r $quota -l "vm.cpu $cpu COUNT, vm.memory $mem GB, vm $vm COUNT, persistent-disk.count $persistentdisk COUNT, persistent-disk.capacity $persistentddiskcapacity GB, ephemeral-disk $ephemeraldisk COUNT, ephemeral-disk.capacity $ephemeraldiskcapacity GB"
