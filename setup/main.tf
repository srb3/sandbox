terraform {
  required_version = "> 0.12.0"
  backend "azurerm" {
    resource_group_name  = "sbrown_tf_state"
    storage_account_name = "sbrowntfstatechef"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  version = ">= 1.42.0"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.tags
}

module "vnet" {
  source              = "srb3/vnet/azurerm"
  version             = "0.0.2"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  address_space       = var.address_space
  subnet_prefixes     = var.subnet_prefix
  subnet_names        = var.subnet_names
  tags                = var.tags
}

module "chef_automate_base" {
  source                        = "srb3/workshop-server/azurerm"
  version                       = "0.0.8"
  resource_group_name           = var.resource_group_name
  resource_group_location       = var.resource_group_location
  create_user                   = var.create_user
  user_name                     = var.user_name
  user_private_key              = var.user_private_key
  user_public_key               = var.user_public_key
  predefined_rules              = var.predefined_rules
  custom_rules                  = var.custom_rules
  vnet_subnet_id                = module.vnet.vnet_subnets[0]
  public_ip_dns                 = var.chef_automate_hostname
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
  source                = "srb3/chef-automate/linux"
  version               = "0.0.16"
  ips                   = module.chef_automate_base.server_public_ip
  instance_count        = var.server_count
  install_version       = var.chef_automate_version
  ssh_user_name         = var.user_name
  ssh_user_private_key  = var.user_private_key
  fqdns                 = module.chef_automate_base.public_ip_dns_name
  module_input          = jsonencode(module.chef_automate_base.vm_ids)
  chef_automate_license = var.chef_automate_license
  channel               = var.chef_automate_channel
  products              = var.chef_automate_products
  data_collector_token  = var.data_collector_token
  admin_password        = var.chef_automate_admin_password
}

module "sql_database_prod" {
  source              = "Azure/database/azurerm"
  version             = "1.1.0"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  db_name             = var.db_name_prod
  sql_admin_username  = var.db_admin_username_prod
  sql_password        = var.db_admin_password_prod
  tags                = var.tags
}

module "sql_database_dev" {
  source              = "Azure/database/azurerm"
  version             = "1.1.0"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  db_name             = var.db_name_dev
  sql_admin_username  = var.db_admin_username_dev
  sql_password        = var.db_admin_password_dev
  tags                = var.tags
}

module "workstation_base" {
  source                        = "srb3/workshop-server/azurerm"
  version                       = "0.0.8"
  resource_group_name           = var.resource_group_name
  resource_group_location       = var.resource_group_location
  create_user                   = var.create_user
  user_name                     = var.workstation_user_name
  user_pass                     = var.workstation_user_password
  predefined_rules              = var.workstation_predefined_rules
  custom_rules                  = var.workstation_custom_rules
  vnet_subnet_id                = module.vnet.vnet_subnets[0]
  public_ip_dns                 = var.workstation_hostname
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
  tags                          = var.tags
  system_type                   = "windows"
}

module "docker_host_base" {
  source                        = "srb3/workshop-server/azurerm"
  version                       = "0.0.8"
  resource_group_name           = var.resource_group_name
  resource_group_location       = var.resource_group_location
  user_name                     = var.user_name
  create_user                   = var.create_user
  user_private_key              = var.user_private_key
  user_public_key               = var.user_public_key
  predefined_rules              = var.docker_host_predefined_rules
  custom_rules                  = var.docker_host_custom_rules
  vnet_subnet_id                = module.vnet.vnet_subnets[0]
  public_ip_dns                 = var.docker_host_hostname
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

locals {
  service = {
    "srb3/chef_docker_wrapper" = {}
  }
}

module "docker_host_prod" {
  source               = "srb3/habitat/chef"
  version              = "0.0.6"
  ips                  = module.docker_host_base.server_public_ip[0]
  instance_count       = local.instance_count
  user_name            = var.user_name
  user_private_key     = var.user_private_key
  hab_services         = local.services
  bldr_url             = "${module.chef_automate.url}/bldr"
  hab_services_channel = "stable"
  hab_sup_auto_update  = true
}

module "docker_host_dev" {
  source               = "srb3/habitat/chef"
  version              = "0.0.6"
  ips                  = module.docker_host_base.server_public_ip[1]
  instance_count       = local.instance_count
  user_name            = var.user_name
  user_private_key     = var.user_private_key
  hab_services         = local.services
  bldr_url             = "${module.chef_automate.url}/bldr"
  hab_services_channel = "unstable"
  hab_sup_auto_update  = true
}
