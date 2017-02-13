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

#flavor size variables
#tiny-vm
tinyname=tiny-vm
tinycpu=1
tinymem=512
tinycost=1
#small-vm
smallname=small-vm
smallcpu=1
smallmem=1
smallcost=2
#medium-vm
mediumname=medium-vm
mediumcpu=2
mediummem=2
mediumcost=3

#create flavors
echo y | photon flavor create --name "$tinyname" --kind "vm" --cost "vm.cpu $tinycpu COUNT, vm.memory $tinymem MB, vm.cost $tinycost COUNT"
echo y | photon flavor create --name "$smallname" --kind "vm" --cost "vm.cpu $smallcpu COUNT, vm.memory $smallmem GB, vm.cost $smallcost COUNT"
echo y | photon flavor create --name "$mediumname" --kind "vm" --cost "vm.cpu $mediumcpu COUNT, vm.memory $mediummem GB, vm.cost $mediumcost COUNT"
