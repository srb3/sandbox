########### aws details #########################

variable "tags" {
  type    = map
  default = {}
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

############ new settings #######################

variable "resource_group_name" {
  description = "The name of the resource group to create"
  type        = string
}

variable "resource_group_location" {
  description = "The geographical location of the resource group"
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

############ workstation settings #######################

variable "workstation_source_address_prefix" {
  description = "The source address prefix to allow access to the workstation from"
  type        = list
  default     = []
}

variable "workstation_predefined_rules" {
  description = "The Predefined rules for this test server"
  type        = list
  default     = [
    {
      name     = "WinRM",
      priority = "200"
    },
    {
      name     = "RDP",
      priority = "201"
    }
  ]
}

variable "workstation_custom_rules" {
  description = "The custom rules for this test server"
  type        = list
  default     = []
}

variable "workstation_vm_size" {
  description = "The size of the vm to create"
  type        = string
  default     = "Standard_DS1_V2"
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
