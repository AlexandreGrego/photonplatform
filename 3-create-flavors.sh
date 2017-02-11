#!/bin/bash
set -x #echo on

#tenants
tenant1=orgADevAdmins
tenant2=orgBDevAdmins

#projects
project1=orgADept1
project2=orgADept2
project3=orgBDept1
project4=orgBDept2

#create projects
photon tenant set $tenant1
photon project set $project1
echo y | photon flavor create --name "tiny-vm" --kind "vm" --cost "vm.cpu 1 COUNT, vm.memory 512 MB, vm.cost 1 COUNT"
echo y | photon flavor create --name "small-vm" --kind "vm" --cost "vm.cpu 1 COUNT, vm.memory 1 GB, vm.cost 2 COUNT"
echo y | photon flavor create --name "medium-vm" --kind "vm" --cost "vm.cpu 2 COUNT, vm.memory 2 GB, vm.cost 3 COUNT"

photon tenant set $tenant1
photon project set $project2
echo y | photon flavor create --name "tiny-vm" --kind "vm" --cost "vm.cpu 1 COUNT, vm.memory 512 MB, vm.cost 1 COUNT"
echo y | photon flavor create --name "small-vm" --kind "vm" --cost "vm.cpu 1 COUNT, vm.memory 1 GB, vm.cost 2 COUNT"
echo y | photon flavor create --name "medium-vm" --kind "vm" --cost "vm.cpu 2 COUNT, vm.memory 2 GB, vm.cost 3 COUNT"

photon tenant set $tenant2
photon project set $project3
echo y | photon flavor create --name "tiny-vm" --kind "vm" --cost "vm.cpu 1 COUNT, vm.memory 512 MB, vm.cost 1 COUNT"
echo y | photon flavor create --name "small-vm" --kind "vm" --cost "vm.cpu 1 COUNT, vm.memory 1 GB, vm.cost 2 COUNT"
echo y | photon flavor create --name "medium-vm" --kind "vm" --cost "vm.cpu 2 COUNT, vm.memory 2 GB, vm.cost 3 COUNT"

photon tenant set $tenant2
photon project set $project4
echo y | photon flavor create --name "tiny-vm" --kind "vm" --cost "vm.cpu 1 COUNT, vm.memory 512 MB, vm.cost 1 COUNT"
echo y | photon flavor create --name "small-vm" --kind "vm" --cost "vm.cpu 1 COUNT, vm.memory 1 GB, vm.cost 2 COUNT"
echo y | photon flavor create --name "medium-vm" --kind "vm" --cost "vm.cpu 2 COUNT, vm.memory 2 GB, vm.cost 3 COUNT"

