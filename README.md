#PhotonPlatform

The purpose of this repository is to help automate the initial configuration of Tenants, Projects, Quota's, Networks, Images, Clusters (Harbor and Kubernetes).
You can modify any of the variables to fit your deployment and environment. 

##Environment requirements:
- Photon Platform Deployed
- The repository includes file called **photon-platform-config.yaml**, you can use this as a template to deploy Photon Platform in your environment.
- You can use this guide to deploy Photon Platform - [Photon Controller Quick Start Guide](https://vmware.github.io/photon-controller/assets/files/Photon_Controller_Getting_Started_Guide_20151116.pdf)

##Workstation Software Requirements:
- photon cli binary [Download](https://github.com/vmware/photon-controller/releases)
  - **NOTE:** You will need to rename the binary from `photon-linux64-1.x.x-xxxxxxx` to `photon`
- Git (optional: if you want to clone the repository)
- awk or gawk (If you are executing these on Photon OS you can use "**tdnf install gawk**")

##Brief overview of what each script is doing.

**[login.sh](login.sh)**
  - This script will login and authenticate you to Photon Platform. If your token expires you can always re-run this script to log back in.
  - Provide the username/password, and tenant you provided during the installation of Photon Platform
  - After the deployment is complete it will display your API endpoint

**[1-create-tenants-quotas.sh](1-create-tenants-quotas.sh)**
  - Photon Platform has multiple levels of tenancy, the first one tenants.
  - First, the script will create two tenants `orgADevs` and `orgBDevs`. You can modify these to fit your organziation hierachy.
  - Second, the script will create identical quota's (cloud resources) in each tenant created.
  - Modify the #quota variables to match your cloud environment
 
**[2-create-projects.sh](2-create-projects.sh)**
  - Projects are the second level of tenancy in Photon Platform. Projects are built inside of tenants. 
  - This script will create two projects inside each tenant created in the previous script.
  - When you create a project, you will also assign a portion of the quota created in the previous script. For example, the quota variables in this script are half of what was created previously. This allows you to allocate resources to two projects.

**[3-create-flavors.sh](3-create-flavors.sh)**
  - 
  
**[4-create-networks.sh](4-create-networks.sh)**
  - 
  
**[5-create-images.sh](5-create-images.sh)**
  - 
  
**[6-create-cluster-types.sh](6-create-cluster-types.sh)**
  -
  
**[7-create-harbor-registry.sh](7-create-harbor-registry.sh)**
  - 
  
**[8-create-k8s-cluster.sh](8-create-k8s-cluster.sh)**
  - 
  
  

