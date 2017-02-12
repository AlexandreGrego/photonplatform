#!/bin/bash
set -x #echo on

#tenant variables
tenant1=orgADevs
tenant2=orgBDevs

#project variables
project1=orgADept1
project2=orgADept2
project3=orgBDept1
project4=orgBDept2

#flavor sizes
#tiny-vm
name=tiny-vm
cpu=1
mem=512
cost=1
#small-vm
name=small-vm
cpu=1
mem=1
cost=2
#medium-vm
name=medium-vm
cpu=2
mem=2
cost=3

#create flavors
echo y | photon flavor create --name "$name" --kind "vm" --cost "vm.cpu $cpu COUNT, vm.memory $mem MB, vm.cost $cost COUNT"
echo y | photon flavor create --name "$name" --kind "vm" --cost "vm.cpu $cpu COUNT, vm.memory $mem GB, vm.cost $cost COUNT"
echo y | photon flavor create --name "$name" --kind "vm" --cost "vm.cpu $cpu COUNT, vm.memory $mem GB, vm.cost $cost COUNT"
