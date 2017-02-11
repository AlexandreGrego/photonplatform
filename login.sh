#!/bin/bash
set -x #echo on

#Variables
user=Administrator
pass="VMware1!"
tenant=photoncloud
api=https://192.168.110.93:443

photon target set -c $api && photon target login -u $user@$tenant -p $pass

