########### state ###############################

variable "state_resource_group" {
  description = "The resource group name that holds the state storage account"
  type        = string
}

variable "state_storage_group" {
  description = "The storagegroup name that holds the state container"
  type        = string
}

variable "state_container" {
  description = "The container name that holds the state"
  type        = string
}

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
  default     = []
}

variable "source_address_prefix" {
  description = "The source address prefix to allow access to the vms from"
  type        = list
  default     []
}

variable "workstation_source_address_prefix" {
  description = "The source address prefix to allow access to the workstation from"
  type        = list
  default     []
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

########### Azure MSSQL settings ################

variable "db_name_prod" {
  description = "The name of the mssql instance"
  type        = "string"
  default     = "mydb"
}

variable "db_admin_username_prod" {
  description = "The admin user name for the db instance"
  type        = "string"
  default     = "admin"
}

variable "db_admin_password_prod" {
  description = "The admin password for the db instance"
  type        = "string"
}

########### Azure MSSQL settings ################

variable "db_name_dev" {
  description = "The name of the mssql dev instance"
  type        = "string"
  default     = "mydbdev"
}

variable "db_admin_username_dev" {
  description = "The admin user name for the db instance"
  type        = "string"
  default     = "admin"
}

variable "db_admin_password_dev" {
  description = "The admin password for the db instance"
  type        = "string"
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

############ workstation settings #######################

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

############ docker_host settings #######################

variable "docker_host_predefined_rules" {
  description = "The Predefined rules for this test server"
  type        = list
  default     = [
    {
      name     = "SSH",
      priority = "200"
    }
  ]
}

variable "docker_port" {
  description = "The custom rules for the docker hosts"
  type        = string
  default     = "2375"
}

variable "docker_host_vm_size" {
  description = "The size of the vm to create"
  type        = string
  default     = "Standard_DS1_V2"
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
