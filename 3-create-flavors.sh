#!/bin/bash
set -x #echo on

#read in global vars
. ./globalvars.sh

#flavor size variables
#kinds
vm=vm
ephemeraldisk=ephemeral-disk
persistentdisk=persistent-disk
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
#large-vm
largename=large-vm
largecpu=2
largemem=4
largecost=4
#ephemeral-vm-disk
ephemeraldiskname1=vm-disk
diskcount1=1
diskcost1=1
#persistent-vm-disk
persistentdiskname1=vm-disk
#cluster-vm-disk ephemeral-vm-disk
clusterephemeraldiskname1=cluster-vm-disk

#create flavors
echo y | photon flavor create --name "$tinyname" --kind "$vm" --cost "vm.cpu $tinycpu COUNT, vm.memory $tinymem MB, vm.cost $tinycost COUNT"
echo y | photon flavor create --name "$smallname" --kind "$vm" --cost "vm.cpu $smallcpu COUNT, vm.memory $smallmem GB, vm.cost $smallcost COUNT"
echo y | photon flavor create --name "$mediumname" --kind "$vm" --cost "vm.cpu $mediumcpu COUNT, vm.memory $mediummem GB, vm.cost $mediumcost COUNT"
echo y | photon flavor create --name "$largename" --kind "$vm" --cost "vm.cpu $largecpu COUNT, vm.memory $largemem GB, vm.cost $largecost COUNT"
echo y | photon flavor create --name "$ephemeraldiskname1" --kind "$ephemeraldisk" --cost "ephemeral-disk $diskcount1 COUNT, ephemeral-disk.flavor.$ephemeraldiskname1 1 COUNT, ephemeral-disk.cost $diskcost1 COUNT"
echo y | photon flavor create --name "$clusterephemeraldiskname1" --kind "$ephemeraldisk" --cost "ephemeral-disk $diskcount1 COUNT, ephemeral-disk.flavor.$ephemeraldiskname1 1 COUNT, ephemeral-disk.cost $diskcost1 COUNT"
echo y | photon flavor create --name "$persistentdiskname1" --kind "$persistentdisk" --cost "persistent-disk $diskcount1 COUNT, persistent-disk.flavor.$persistentdiskname1 1 COUNT, persistent-disk.cost $diskcost1 COUNT"
