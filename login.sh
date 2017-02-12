#!/bin/bash
set -x #echo on

#Variables
user=Administrator
pass="VMware1!"
tenant=photoncloud
api=https://192.168.119.90:443

echo y | photon target set -c $api && photon target login -u $user@$tenant -p $pass

