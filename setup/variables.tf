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

variable "predefined_rules" {
  description = "The Predefined rules for this test server"
  type        = list
  default     = [
    {
      name     = "SSH"
      priority = "200"
    }
  ]
}

variable "custom_rules" {
  description = "The custom rules for this test server"
  type        = list
  default     = [
    {
      name                   = "myhttp"
      priority               = "200"
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "tcp"
      destination_port_range = "8080"
      description            = "description-myhttp"
    }
  ]
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
  default     = "dynamic"
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
  type        = bool
  description = "Set to true to add a datadisk."
  default     = false
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

variable "chef_automate_hostname" {
  type    = string
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

variable "data_collector_token" {
  type    = string
  default = ""
}
