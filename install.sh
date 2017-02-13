#!/bin/bash
set -x #echo on

#variables
installer=192.168.110.90
configyaml=photon-platform-config.yaml

#install photon platform

#set API endpoint to photon installer
photon target set http://$installer:9000

#deploy photon platform
photon system deploy $configyaml
