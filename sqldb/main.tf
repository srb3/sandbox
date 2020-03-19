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

############ workstation settings #######################


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

variable "docker_host_data_disk" {
  description = "Set to true to add a datadisk."
  type        = bool
  default     = false
}

variable "docker_host_hostname" {
  description = "The hostname for the docker_host instance"
  type        = string
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

########### Azure MSSQL settings ################

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

terraform {
  required_version = "> 0.12.0"
}

provider "azurerm" {
  version = "> 2.0.0"
  skip_provider_registration = true
  features {}
}

module "vnet" {
  source              = "/home/steveb/workspace/terraform/modules/srb3/terraform-azurerm-vnet"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  address_space       = var.address_space
  subnet_prefixes     = var.subnet_prefix
  subnet_names        = var.subnet_names
  tags                = var.tags
}

module "sql_database_prod" {
  source              = "/home/steveb/workspace/terraform/modules/srb3/terraform-azurerm-database"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  db_name             = var.db_name_prod
  sql_admin_username  = var.db_admin_username_prod
  sql_password        = var.db_admin_password_prod
  sql_firewall_rules  = var.db_access_ips
  tags                = var.tags
}

locals {
  workstation_source_address_prefix = var.workstation_source_address_prefix != "" ? var.workstation_source_address_prefix : "*"
  ssh_custom_rules = [
    {
      name                   = "ssh_filtered"
      priority               = "404"
      direction              = "Inbound"
      access                 = "Allow"
      destination_port_range = "22"
      description            = "The ssh port"
      source_address_prefix  = local.workstation_source_address_prefix
    }
  ]
  win_custom_rules = [
    {
      name                   = "winrm_filtered"
      priority               = "401"
      direction              = "Inbound"
      access                 = "Allow"
      destination_port_range = "5986"
      description            = "The winrm port"
      source_address_prefix  = local.workstation_source_address_prefix
    },
    {
      name                   = "rdp_filtered"
      priority               = "402"
      direction              = "Inbound"
      access                 = "Allow"
      destination_port_range = "3389"
      description            = "The rdp port"
      source_address_prefix  = local.workstation_source_address_prefix
    }
  ]
}

module "chef_automate_base" {
  source                        = "/home/steveb/workspace/terraform/modules/srb3/terraform-azurerm-workshop-server"
  resource_group_name           = var.resource_group_name
  resource_group_location       = var.resource_group_location
  create_user                   = var.create_user
  user_name                     = var.user_name
  user_private_key              = var.user_private_key
  user_public_key               = var.user_public_key
  custom_rules                  = local.ssh_custom_rules
  vnet_subnet_id                = module.vnet.vnet_subnets[0]
  nb_instances                  = var.server_count
  instance_name                 = var.chef_automate_hostname
  vm_size                       = var.vm_size
  vm_os_simple                  = var.vm_os_simple
  vm_os_id                      = var.vm_os_id
  vm_os_publisher               = var.vm_os_publisher
  vm_os_offer                   = var.vm_os_offer
  vm_os_sku                     = var.vm_os_sku
  vm_os_version                 = var.vm_os_version
  allocation_method             = var.allocation_method
  nb_public_ip                  = var.nb_public_ip
  delete_os_disk_on_termination = var.delete_os_disk_on_termination
  data_sa_type                  = var.data_sa_type
  data_disk_size_gb             = var.data_disk_size_gb
  data_disk                     = var.data_disk
  install_workstation_tools     = true
  populate_hosts                = true
  domain_name_label             = var.chef_automate_hostname
  tags                          = var.tags
}

module "chef_automate" {
  source               = "srb3/chef-automate/linux"
  version              = "0.0.23"
  ips                  = module.chef_automate_base.server_public_ip
  instance_count       = var.server_count
  install_version      = var.chef_automate_version
  ssh_user_name        = var.user_name
  ssh_user_private_key = var.user_private_key
  module_input         = jsonencode(module.chef_automate_base.vm_ids)
  hostname_method      = var.chef_automate_hostname_method
  channel              = var.chef_automate_channel
  products             = var.chef_automate_products
  data_collector_token = var.data_collector_token
  admin_password       = var.chef_automate_admin_password
}

module "workstation_base" {
  source                        = "/home/steveb/workspace/terraform/modules/srb3/terraform-azurerm-workshop-server"
  resource_group_name           = var.resource_group_name
  resource_group_location       = var.resource_group_location
  create_user                   = var.create_user
  user_name                     = var.workstation_user_name
  user_pass                     = var.workstation_user_password
  custom_rules                  = local.win_custom_rules
  vnet_subnet_id                = module.vnet.vnet_subnets[0]
  nb_instances                  = var.workstation_count
  instance_name                 = var.workstation_hostname
  vm_size                       = var.workstation_vm_size
  vm_os_simple                  = var.workstation_vm_os_simple
  vm_os_id                      = var.workstation_vm_os_id
  vm_os_publisher               = var.workstation_vm_os_publisher
  vm_os_offer                   = var.workstation_vm_os_offer
  vm_os_sku                     = var.workstation_vm_os_sku
  vm_os_version                 = var.workstation_vm_os_version
  allocation_method             = var.workstation_allocation_method  
  nb_public_ip                  = var.workstation_nb_public_ip
  delete_os_disk_on_termination = var.workstation_delete_os_disk_on_termination
  data_sa_type                  = var.workstation_data_sa_type
  data_disk_size_gb             = var.workstation_data_disk_size_gb
  data_disk                     = var.workstation_data_disk 
  install_workstation_tools     = true
  workstation_hab               = true
  workstation_chef              = true
  populate_hosts                = true
  domain_name_label             = var.workstation_hostname
  nested_virt                   = var.workstation_nested_virt
  hab_pkg_export                = var.workstation_hab_pkg_export
  tags                          = var.tags
  system_type                   = "windows"
}

module "setup_workstations" {
  source                   = "/home/steveb/workspace/terraform/modules/srb3/terraform-chef-workstation"
  ips                      = module.workstation_base.server_public_ip
  instance_count           = var.workstation_count
  user_name                = var.workstation_user_name
  user_pass                = var.workstation_user_password
  automate_module          = jsonencode(module.chef_automate)
  github_repos             = jsonencode(var.github_repos)
  github_ssh_key           = file(var.github_ssh_key)
  bootstrap_github_user    = var.github_user
  bootstrap_github_email   = var.github_email
  server_ssh_key           = file(var.user_private_key)
  urls                     = length(module.chef_automate.url) > 0 ? [module.chef_automate.url[0]] : []
  restart                  = false
  bootstrap_ssh_username   = var.user_name
  bootstrap_win_ips        = []
  bootstrap_lin_ips        = module.docker_host_base.server_private_ip
  system_type              = "windows"
}
locals {
  docker_host_custom_rules = [
    {
      name                   = "ssh_filtered"
      priority               = "400"
      direction              = "Inbound"
      access                 = "Allow"
      destination_port_range = "22"
      description            = "The ssh port"
      source_address_prefix  = "*"
    }
  ]
}

module "docker_host_base" {
  source                        = "/home/steveb/workspace/terraform/modules/srb3/terraform-azurerm-workshop-server"
  resource_group_name           = var.resource_group_name
  resource_group_location       = var.resource_group_location
  user_name                     = var.user_name
  create_user                   = var.create_user
  user_private_key              = var.user_private_key
  user_public_key               = var.user_public_key
  custom_rules                  = local.docker_host_custom_rules
  vnet_subnet_id                = module.vnet.vnet_subnets[0]
  nb_instances                  = var.docker_host_count
  instance_name                 = var.docker_host_hostname
  vm_size                       = var.docker_host_vm_size
  vm_os_simple                  = var.docker_host_vm_os_simple
  allocation_method             = var.docker_host_allocation_method  
  nb_public_ip                  = var.docker_host_nb_public_ip
  delete_os_disk_on_termination = var.docker_host_delete_os_disk_on_termination
  data_sa_type                  = var.docker_host_data_sa_type
  data_disk_size_gb             = var.docker_host_data_disk_size_gb
  data_disk                     = var.docker_host_data_disk 
  populate_hosts                = true
  domain_name_label             = var.docker_host_hostname
  tags                          = var.tags
}

output "geoapp_db_connection_string_prod" {
  value = module.sql_database_prod.connection_string
}

output "geoapp_db_database_name_prod" {
  value = module.sql_database_prod.database_name
}

output "geoapp_db_sql_server_fqdn_prod" {
  value = module.sql_database_prod.sql_server_fqdn
}

output "db_admin_username_prod" {
  value = var.db_admin_username_prod
}

output "db_admin_password_prod" {
  value = var.db_admin_password_prod
}

########### chef automate output #################

output "chef_automate_public_ip" {
  value = module.chef_automate_base.server_public_ip
}

output "chef_automate_private_ip" {
  value = module.chef_automate_base.server_private_ip
}

output "chef_automate_hostname" {
  value = module.chef_automate_base.public_ip_fqdn
}

########### workstation output ##################

output "chef_workstation_public_ip" {
  value = module.workstation_base.server_public_ip
}

output "chef_worksation_private_ip" {
  value = module.workstation_base.server_private_ip
}

output "chef_workstation_hostname" {
  value = module.workstation_base.public_ip_fqdn
}

########### docker hosts output ##################

output "docker_host_public_ip" {
  value = module.docker_host_base.server_public_ip
}

output "docker_host_private_ip" {
  value = module.docker_host_base.server_private_ip
}

output "docker_host_hostname" {
  value = module.docker_host_base.public_ip_fqdn
}
