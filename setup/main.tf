terraform {
  required_version = "> 0.12.0"
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
  version                       = "0.0.5"
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
  is_windows_image              = var.is_windows_image
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
