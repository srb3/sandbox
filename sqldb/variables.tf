variable "tags" {
  type    = map
  default = {}
}

########### workstation setup settings ##########

variable "github_repos" {
  description = "A list of repos to clone from github" 
  type        = list
  default     = []
}

variable "github_ssh_key" {
  description = "The path to an ssh key to use for github auth"
  type        = string
  default     = ""
}

variable "github_user" {
  description = "A user name for an exisiting github account"
  type        = string
  default     = "jsoe"
}

variable "github_email" {
  description = "An email for an exisiting github account"
  type        = string
  default     = "jsoe@mail.com"
}

########### chef Autoamte settings ##############

variable "chef_automate_admin_password" {
  type    = string
  default = ""
}

variable "chef_automate_license" {
  type    = string
  default = ""
}

variable "chef_automate_version" {
  type    = string
  default = "latest"
}

variable "chef_automate_channel" {
  type    = string
  default = "current"
}

variable "chef_automate_products" {
  type    = list
  default = ["automate"]
}

variable "chef_automate_hostname_method" {
  description = "The method used to set the chef automate hostname, ignored if setting the fqdn module variable directly"
  type        = string
  default     = "fqdn"
}

variable "data_collector_token" {
  type    = string
  default = ""
}

variable "chef_automate_private_ips" {
  description = "A list of private ips to give the chef automate instances"
  type        = list
  default     = []
}

############ workstation settings #######################

variable "workstation_source_address" {
  description = "The source address of the workstation running terraform"
  type        = string
}

variable "workstation_source_address_prefix" {
  description = "The source address prefix to allow access to the workstation from"
  type        = string
  default     = ""
}

variable "workstation_custom_rules" {
  description = "The custom rules for this test server"
  type        = list
  default     = []
}

variable "workstation_vm_size" {
  description = "The size of the vm to create"
  type        = string
  default     = "Standard_B2ms"
}

variable "workstation_count" {
  default = 1
}

variable "workstation_vm_os_simple" {
  description = "Specify UbuntuServer, WindowsServer, RHEL, openSUSE-Leap, CentOS, Debian, CoreOS and SLES to get the latest image version of the specified os.  Do not provide this value if a custom value is used for vm_os_publisher, vm_os_offer, and vm_os_sku."
  default     = ""
}

variable "workstation_vm_os_id" {
  description = "The resource ID of the image that you want to deploy if you are using a custom image.Note, need to provide is_windows_image = true for windows custom images."
  default     = ""
}

variable "workstation_is_windows_image" {
  description = "Boolean flag to notify when the custom image is windows based."
  default     = false
}

variable "workstation_vm_os_publisher" {
  description = "The name of the publisher of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "workstation_vm_os_offer" {
  description = "The name of the offer of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "workstation_vm_os_sku" {
  description = "The sku of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "workstation_vm_os_version" {
  description = "The version of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = "latest"
}

variable "workstation_allocation_method" {
  description = "Defines how an IP address is assigned. Options are Static or Dynamic."
  default     = "Dynamic"
}

variable "workstation_nb_public_ip" {
  description = "Number of public IPs to assign corresponding to one IP per vm. Set to 0 to not assign any public IP addresses."
  default     = "1"
}

variable "workstation_delete_os_disk_on_termination" {
  type        = bool
  description = "Delete datadisk when machine is terminated"
  default     = false
}

variable "workstation_data_sa_type" {
  description = "Data Disk Storage Account type"
  default     = "Standard_LRS"
}

variable "workstation_data_disk_size_gb" {
  description = "Storage data disk size size"
  default     = ""
}
variable "workstation_os_disk_size_gb" {
  description = "Storage data disk size size"
  default     = "127"
}
variable "workstation_data_disk" {
  description = "Set to true to add a datadisk."
  type        = bool
  default     = false
}

variable "workstation_hostname" {
  description = "The hostname for the workstation instance"
  type        = string
}

variable "workstation_user_name" {
  description = "The user name for the workstation"
  type        = string
  default     = "chef"
}

variable "workstation_user_password" {
  description = "The password for the workstation user"
  type        = string
  default     = "P@55w0rd1"
}

variable "workstation_nested_virt" {
  description = "Set up this host as a nested virt host"
  type        = bool
  default     = false
}

variable "workstation_hab_pkg_export" {
  description = "A habitat package to install and export as a socker container"
  type        = string
  default     = ""
}

variable "workstation_hab_pkgs" {
  description = "A list of habitat packages to install"
  type        = list
  default     = []
}

variable "workstation_private_ips" {
  description = "A list of private ips to give the chef automate instances"
  type        = list
  default     = []
}

############ docker_host settings #######################

variable "docker_port" {
  description = "The custom rules for the docker hosts"
  type        = string
  default     = "2375"
}

variable "docker_host_vm_size" {
  description = "The size of the vm to create"
  type        = string
  default     = "Standard_B2ms"
}

variable "docker_host_count" {
  default = 1
}

variable "docker_host_vm_os_simple" {
  description = "Specify UbuntuServer, WindowsServer, RHEL, openSUSE-Leap, CentOS, Debian, CoreOS and SLES to get the latest image version of the specified os.  Do not provide this value if a custom value is used for vm_os_publisher, vm_os_offer, and vm_os_sku."
  default     = "CentOS"
}

variable "docker_host_allocation_method" {
  description = "Defines how an IP address is assigned. Options are Static or Dynamic."
  default     = "Dynamic"
}

variable "docker_host_nb_public_ip" {
  description = "Number of public IPs to assign corresponding to one IP per vm. Set to 0 to not assign any public IP addresses."
  default     = "1"
}

variable "docker_host_delete_os_disk_on_termination" {
  type        = bool
  description = "Delete datadisk when machine is terminated"
  default     = false
}

variable "docker_host_data_sa_type" {
  description = "Data Disk Storage Account type"
  default     = "Standard_LRS"
}

variable "docker_host_data_disk_size_gb" {
  description = "Storage data disk size size"
  default     = ""
}
variable "docker_host_os_disk_size_gb" {
  description = "Storage data disk size size"
  default     = "30"
}
variable "docker_host_data_disk" {
  description = "Set to true to add a datadisk."
  type        = bool
  default     = false
}

variable "docker_host_hostname" {
  description = "The hostname for the docker_host instance"
  type        = string
}

variable "docker_host_private_ips" {
  description = "A list of private ips to give the chef automate instances"
  type        = list
  default     = []
}
########### azure agent base ####################

variable "azure_agent_org" {
  description = "The org to assign the azure agent to"
  type        = string
  default     = ""
}

variable "azure_agent_pat" {
  description = "The PAT to auth the azure agent"
  type        = string
  default     = "" 
}

variable "azure_agent_hostname" {
  type    = string
}

variable "azure_agent_vm_size" {
  description = "The size of the Chef Automate vm"
  type        = string
  default     = "Standard_B2ms"
}

variable "azure_agent_count" {
  default = 1
}

variable "azure_agent_vm_os_simple" {
  description = "Specify UbuntuServer, WindowsServer, RHEL, openSUSE-Leap, CentOS, Debian, CoreOS and SLES to get the latest image version of the specified os.  Do not provide this value if a custom value is used for vm_os_publisher, vm_os_offer, and vm_os_sku."
  default     = ""
}

variable "azure_agent_vm_os_id" {
  description = "The resource ID of the image that you want to deploy if you are using a custom image.Note, need to provide is_windows_image = true for windows custom images."
  default     = ""
}

variable "azure_agent_is_windows_image" {
  description = "Boolean flag to notify when the custom image is windows based."
  default     = false
}

variable "azure_agent_vm_os_publisher" {
  description = "The name of the publisher of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "azure_agent_vm_os_offer" {
  description = "The name of the offer of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "azure_agent_vm_os_sku" {
  description = "The sku of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "azure_agent_vm_os_version" {
  description = "The version of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = "latest"
}

variable "azure_agent_allocation_method" {
  description = "Defines how an IP address is assigned. Options are Static or Dynamic."
  default     = "Dynamic"
}

variable "azure_agent_nb_public_ip" {
  description = "Number of public IPs to assign corresponding to one IP per vm. Set to 0 to not assign any public IP addresses."
  default     = "1"
}

variable "azure_agent_delete_os_disk_on_termination" {
  type        = bool
  description = "Delete datadisk when machine is terminated"
  default     = false
}

variable "azure_agent_data_sa_type" {
  description = "Data Disk Storage Account type"
  default     = "Standard_LRS"
}

variable "azure_agent_data_disk_size_gb" {
  description = "Storage data disk size size"
  default     = ""
}
variable "azure_agent_os_disk_size_gb" {
  description = "Storage data disk size size"
  default     = "30"
}
variable "azure_agent_data_disk" {
  description = "Set to true to add a datadisk."
  type        = bool
  default     = false
}

variable "azure_agent_private_ips" {
  description = "A list of private ips to give the chef automate instances"
  type        = list
  default     = []
}

########### CA base server settings #############

variable "chef_automate_hostname" {
  type    = string
}

variable "chef_automate_vm_size" {
  description = "The size of the Chef Automate vm"
  type        = string
  default     = "Standard_B2ms"
}

variable "vm_size" {
  description = "The size of the vm to create"
  type        = string
  default     = "Standard_DS1_V2"
}

variable "server_count" {
  default = 1
}

variable "vm_os_simple" {
  description = "Specify UbuntuServer, WindowsServer, RHEL, openSUSE-Leap, CentOS, Debian, CoreOS and SLES to get the latest image version of the specified os.  Do not provide this value if a custom value is used for vm_os_publisher, vm_os_offer, and vm_os_sku."
  default     = ""
}

variable "vm_os_id" {
  description = "The resource ID of the image that you want to deploy if you are using a custom image.Note, need to provide is_windows_image = true for windows custom images."
  default     = ""
}

variable "is_windows_image" {
  description = "Boolean flag to notify when the custom image is windows based."
  default     = false
}

variable "vm_os_publisher" {
  description = "The name of the publisher of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "vm_os_offer" {
  description = "The name of the offer of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "vm_os_sku" {
  description = "The sku of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "vm_os_version" {
  description = "The version of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = "latest"
}

variable "allocation_method" {
  description = "Defines how an IP address is assigned. Options are Static or Dynamic."
  default     = "Dynamic"
}

variable "nb_public_ip" {
  description = "Number of public IPs to assign corresponding to one IP per vm. Set to 0 to not assign any public IP addresses."
  default     = "1"
}

variable "delete_os_disk_on_termination" {
  type        = bool
  description = "Delete datadisk when machine is terminated"
  default     = false
}

variable "data_sa_type" {
  description = "Data Disk Storage Account type"
  default     = "Standard_LRS"
}

variable "data_disk_size_gb" {
  description = "Storage data disk size size"
  default     = ""
}
variable "os_disk_size_gb" {
  description = "Storage data disk size size"
  default     = "40"
}
variable "data_disk" {
  description = "Set to true to add a datadisk."
  type        = bool
  default     = false
}

########### connection details ##################
variable "user_name" {
  type    = string
}

variable "create_user" {
  default = false
}

variable "user_public_key" {
  type    = string
  default = ""
}

variable "user_private_key" {
  type    = string
  default = ""
}

variable "timeout" {
  description = "Timeout for the conneciton"
  type        = string
  default     = "5m"
}
########### Azure MSSQL settings ################

variable "db_name_dev" {
  description = "The name of the mssql instance"
  type        = string
  default     = "mydb"
}

variable "db_admin_username_dev" {
  description = "The admin user name for the db instance"
  type        = string
  default     = "admin"
}

variable "db_admin_password_dev" {
  description = "The admin password for the db instance"
  type        = string
}

variable "db_name_prod" {
  description = "The name of the mssql instance"
  type        = string
  default     = "mydb"
}

variable "db_admin_username_prod" {
  description = "The admin user name for the db instance"
  type        = string
  default     = "admin"
}

variable "db_admin_password_prod" {
  description = "The admin password for the db instance"
  type        = string
}

variable "resource_group_location" {
  description = "The geographical location of the resource group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of a resource group to use"
  type        = string
}

variable "address_space" {
  description = "The address space to assign to our vnet"
  type        = string 
  default     = "10.0.0.0/16"
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
  description = "enable or Disable network policies for the private link endpoint on the subnet"
  type        = bool
  default     = false
}

variable "subnet_prefix" {
  description = "A list of subnet prefixes"
  type        = list
  default     = ["10.0.1.0/24"]
}

variable "subnet_names" {
  description = "A list of names for the subnets"
  type        = list
  default     = ["subnet1"]
}

variable "db_access_ips" {
  description = "A list of IP addresses to allow access to the database from "
  type        = map
  default     = {}
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "storage_container_name" {
  description = "The name of the storage container"
  type        = string
}

########## dns settings ########################

variable "dnsimple_oauth_token" {
  type = string
}

variable "dnsimple_account" {
  type = string
}

variable "dnsimple_domain_name" {
  type = string
}

variable "issuer_url" {
  type    = string
  default = "https://acme-staging-v02.api.letsencrypt.org/directory"
}
