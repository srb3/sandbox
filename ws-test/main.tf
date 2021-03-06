terraform {
  required_version = "> 0.12.0"
}

provider "azurerm" {
  version = "= 1.44.0"
}

resource "azurerm_resource_group" "wsrg" {
  name     = "workstationrg"
  location = "westeurope"
  tags     = var.tags
}

data "azurerm_virtual_network" "vnet" {
  name                = "acctvnet"
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "vnet" {
  name                 = data.azurerm_virtual_network.vnet.subnets[0]
  virtual_network_name = "acctvnet"
  resource_group_name  = var.resource_group_name
}

locals {
  workstation_source_address_prefix = length(var.workstation_source_address_prefix) > 0 ? var.workstation_source_address_prefix : ["*"]
}

module "workstation_base" {
  source                        = "srb3/workshop-server/azurerm"
  version                       = "0.0.20"
  resource_group_name           = "workstationrg"
  resource_group_location       = "westeurope"
  create_user                   = var.create_user
  user_name                     = var.workstation_user_name
  user_pass                     = var.workstation_user_password
  predefined_rules              = var.workstation_predefined_rules
  custom_rules                  = var.workstation_custom_rules
  source_address_prefix         = var.workstation_source_address_prefix
  vnet_subnet_id                = data.azurerm_subnet.vnet.id
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

resource "azurerm_virtual_machine_extension" "setup" {
  name                 = var.workstation_hostname
  location             = var.resource_group_location
  resource_group_name  = var.resource_group_name
  virtual_machine_id   = module.workstation_base.vm_ids[0]
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
    {
      "commandToExecute": "copy C:\\AzureData\\CustomData.bin C:\\bootstrap.ps1"
    }
  SETTINGS
}

resource "azurerm_virtual_machine_extension" "provision" {

  depends_on = [azurerm_virtual_machine_extension.setup]

  name                 = var.workstation_hostname
  location             = var.resource_group_location
  resource_group_name  = var.resource_group_name
  virtual_machine_id   = module.workstation_base.vm_ids[0]
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell -File C:\\bootstrap.ps1"
    }
  SETTINGS
}
