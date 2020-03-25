

terraform {
  required_version = "> 0.12.0"
}

provider "azurerm" {
  version = "> 2.0.0"
  skip_provider_registration = true
  features {}
}

module "vnet" {
  source                                                = "/home/steveb/workspace/terraform/modules/srb3/terraform-azurerm-vnet"
  resource_group_name                                   = var.resource_group_name
  location                                              = var.resource_group_location
  address_space                                         = var.address_space
  subnet_prefixes                                       = var.subnet_prefix
  subnet_names                                          = var.subnet_names
  tags                                                  = var.tags
  subnet_service_endpoints                              = ["Microsoft.Storage"]
  subnet_enforce_private_link_endpoint_network_policies = var.subnet_enforce_private_link_endpoint_network_policies
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
      name                   = "winrm_http_filtered"
      priority               = "403"
      direction              = "Inbound"
      access                 = "Allow"
      destination_port_range = "5985"
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

module "azure_agent_base" {
  source                        = "/home/steveb/workspace/terraform/modules/srb3/terraform-azurerm-workshop-server"
  resource_group_name           = var.resource_group_name
  resource_group_location       = var.resource_group_location
  create_user                   = var.create_user
  user_name                     = var.user_name
  user_private_key              = var.user_private_key
  user_public_key               = var.user_public_key
  custom_rules                  = local.ssh_custom_rules
  vnet_subnet_id                = module.vnet.vnet_subnets[0]
  nb_instances                  = var.azure_agent_count
  instance_name                 = var.azure_agent_hostname
  vm_size                       = var.azure_agent_vm_size
  vm_os_simple                  = var.azure_agent_vm_os_simple
  vm_os_id                      = var.azure_agent_vm_os_id
  vm_os_publisher               = var.azure_agent_vm_os_publisher
  vm_os_offer                   = var.azure_agent_vm_os_offer
  vm_os_sku                     = var.azure_agent_vm_os_sku
  vm_os_version                 = var.azure_agent_vm_os_version
  allocation_method             = var.azure_agent_allocation_method
  nb_public_ip                  = var.azure_agent_nb_public_ip
  delete_os_disk_on_termination = var.azure_agent_delete_os_disk_on_termination
  os_disk_size_gb               = var.azure_agent_os_disk_size_gb
  azure_agent                   = true
  azure_agent_pat               = var.azure_agent_pat
  azure_agent_org               = var.azure_agent_org
  populate_hosts                = true
  domain_name_label             = var.azure_agent_hostname
  tags                          = var.tags
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
  os_disk_size_gb               = var.os_disk_size_gb
  set_hostname                  = false
  install_workstation_tools     = true
  populate_hosts                = true
  domain_name_label             = var.chef_automate_hostname
  tags                          = var.tags
}

module "chef_automate" {
  source                = "srb3/chef-automate/linux"
  version               = "0.0.23"
  ips                   = module.chef_automate_base.server_public_ip
  instance_count        = var.server_count
  install_version       = var.chef_automate_version
  ssh_user_name         = var.user_name
  ssh_user_private_key  = var.user_private_key
  module_input          = jsonencode(module.chef_automate_base.vm_ids)
  hostname_method       = var.chef_automate_hostname_method
  chef_automate_license = var.chef_automate_license
  channel               = var.chef_automate_channel
  products              = var.chef_automate_products
  data_collector_token  = var.data_collector_token
  admin_password        = var.chef_automate_admin_password
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
  os_disk_size_gb               = var.workstation_os_disk_size_gb
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
  restart                  = true
  bootstrap_ssh_username   = var.user_name
  bootstrap_win_ips        = []
  bootstrap_lin_ips        = module.docker_host_base.server_private_ip
  timeout                  = var.timeout
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
  os_disk_size_gb               = var.docker_host_os_disk_size_gb
  populate_hosts                = true
  domain_name_label             = var.docker_host_hostname
  tags                          = var.tags
}


resource "azurerm_storage_account" "filestore" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name

  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [module.vnet.vnet_subnets[0]]
    ip_rules                   = [var.workstation_source_address]
  }

  tags = var.tags
}

resource "azurerm_storage_container" "filestore" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.filestore.name
  container_access_type = "blob"
}

#resource "azurerm_private_endpoint" "vnetstorage" {
#  name                = "vnetstorage"
#  location            = var.resource_group_location
#  resource_group_name = var.resource_group_name
#  subnet_id           = module.vnet.vnet_subnets[0]
#
#  private_service_connection {
#    name                           = "storage-privateserviceconnection"
#    private_connection_resource_id =  azurerm_storage_account.filestore.id
#    subresource_names              = ["blob"]
#    is_manual_connection           = false
#  }
#}

output "storage_account" {
  value = azurerm_storage_account.filestore.primary_blob_host
}

output "storage_account_connection_string_blob" {
  value = azurerm_storage_account.filestore.primary_blob_connection_string
}

output "storage_account_connection_string" {
  value = azurerm_storage_account.filestore.primary_connection_string
}

output "storage_account_primary_access_key" {
  value = azurerm_storage_account.filestore.primary_access_key
}
