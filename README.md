#Photon Platform configuration and validation scripts

The purpose of this repository is to help automate the initial configuration of Tenants, Projects, Quota's, Networks, Images, Clusters (Harbor and Kubernetes).
You can modify any of the variables to fit your deployment and environment. 

##Environment requirements:
- Photon Platform Deployed
  - The repository includes two files; [install.sh](install.sh) and [photon-platform-config.yaml](photon-platform-config.yaml), you can conifgure the yaml file to match you environment and use the install script to deploy it with the photon cli binary found below.
- You can use this guide to deploy Photon Platform - [Photon Controller Quick Start Guide](https://vmware.github.io/photon-controller/assets/files/Photon_Controller_Getting_Started_Guide_20151116.pdf)

##Workstation Software Requirements:
- photon cli binary [Download](https://github.com/vmware/photon-controller/releases)
  - **NOTE:** You will need to rename the binary from `photon-linux64-1.x.x-xxxxxxx` to `photon`
- Git (**optional:** if you want to clone the repository)
- awk or gawk (If you are executing these on Photon OS you can use `tdnf install gawk`)

##Brief overview of what each script is doing.

The scripts are meant to be executed in order. Scripts will use variables that have been created in previous scripts. Please keep this in mind when changing the variables for tenants, projects, and quota's. **Disclaimer:** I'm not, nor claim to be an expert in shell scripting! I'm always looking for feedback on how these can be improved. Thank you!

**[login.sh](login.sh)**
  - This script will login and authenticate you to Photon Platform. If your token expires you can always re-run this script to log back in.
  - Provide the username/password, and tenant you provided during the installation of Photon Platform
  - After the deployment is complete it will display your API endpoint

**[1-create-tenants-quotas.sh](1-create-tenants-quotas.sh)**
  - Photon Platform has multiple levels of tenancy, the first one is tenants.
  - First, the script will create two tenants `orgADevs` and `orgBDevs`. You can modify these to fit your organziation hierachy.
  - Second, the script will create identical quota's (cloud resources) in each tenant created.
  - Modify the #quota variables to match your cloud environment
 
**[2-create-projects.sh](2-create-projects.sh)**
  - Projects are the second level of tenancy in Photon Platform. Projects are created inside of tenants. 
  - This script will create two projects inside each tenant created in the previous script.
  - When you create a project, you will also assign a portion of the quota created in the previous script. For example, the quota variables in this script are half of what was created previously. This allows you to allocate resources to two projects.

**[3-create-flavors.sh](3-create-flavors.sh)**
  - Flavors are a mapped either to a VM or disk image at the time of deployment. When you create a VM, it will be launched with a specific flavor. 
  - This script creates 3 different flavors tiny, small, and medium. 
  - Modify the flavor size variables to match your tenant workloads.
  
**[4-create-networks.sh](4-create-networks.sh)**
  - Networks are needed to provision the tenant instances.
  - These networks need to pre-created on every cloud host in your enviornment.
  - This script creates one "tenant network" and also sets it as the default network. The default network is used later for deploying Kubernetes and other Cluster types.
  
**[5-create-images.sh](5-create-images.sh)**
  - You can import any image that is an OVA or VMDK from your envirnment. Photon Platform has pre-built images that can be used for automatically deploying Kubernetes clusters and Harbor Registry's.
  - Download the Kubernetes and Harbor images [here](https://github.com/vmware/photon-controller/releases)
  - Place these two OVA files in a directory called `images`
  - The script will import the Harbor and Kubernetes images into Photon Platform and make them available for all tenants to consume.
  
**[6-create-cluster-types.sh](6-create-cluster-types.sh)**
  - This script enables Kubernetes and Harbor as available cluster types to deploy
  - In order for this script to run, the images must already be imported in the previous script
  - This will match an image with the appropriate cluster type. For example, the kubernetes image will be matched with the Kubernetes cluster-type
  
**[7-create-harbor-registry.sh](7-create-harbor-registry.sh)**
  - This script will deploy a Harbor registry that can be used to store and pull down container images.
  - The IP Address for the Master needs to match the network you created with [4-create-networks.sh](4-create-networks.sh).
  - If you want to find out more information on Harbor, [click here](https://github.com/vmware/harbor)
  
**[8-create-k8s-cluster.sh](8-create-k8s-cluster.sh)**
  - This will automate the deployment of a Kubernetes cluster
  - The IP Addresses for the Master and ETCD nodes need to match the network you created with [4-create-networks.sh](4-create-networks.sh).
  - You can change the number of workers you want to deploy or you can scale the deployment later with `photon cluster resize <uuid cluster> <number of workers>`
