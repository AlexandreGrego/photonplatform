#!/bin/bash
set -x #echo on

#fetch the required variables
#deploymentuuid=$(photon deployment list | awk 'FNR == 2 {print}')
k8simageuuid=$(photon image list | grep kubernetes | awk '{print $1}')
harborimageuuid=$(photon image list | grep harbor | awk '{print $1}')

#enable kubernetes as a cluster-type
photon -n deployment enable-cluster-type -k KUBERNETES -i $k8simageuuid

#enable harbor registry as a cluster-type
photon -n deployment enable-cluster-type -k HARBOR -i $harborimageuuid
