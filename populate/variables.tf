variable "builder_public_ip" {
  description = "The ip address of the builder instance"
  type        = string
}

variable "builder_private_ip" {
  description = "The private ip of the builder instance"
  type        = string
  default     = ""
}

variable "builder_hostname" {
  description = "The hostname of the builder instance"
  type        = string
}

variable "ssh_user" {
  description = "The user name used to ssh to the builder instace"
  type        = string
}

variable "ssh_private_key_path" {
  description = "path to an ssh private key"
  type        = string
}

variable "public_auth_token" {
  description = "A habitiat builder access token generated from the public builder"
  type        = string
}

variable "private_auth_token" {
  description = "A habitiat builder access token generated from the on prem builder"
  type        = string
}

variable "hab_pkgs_linux_unstable" {
  description = "A list of linux pakages to download from public builder and then upload to private builder"
  type        = list
}

variable "hab_pkgs_win_unstable" {
  description = "A list of windows pakages to download from public builder and then upload to private builder"
  type        = list
}

variable "hab_pkgs_linux_stable" {
  description = "A list of linux pakages to download from public builder and then upload to private builder"
  type        = list
}

variable "hab_pkgs_win_stable" {
  description = "A list of windows pakages to download from public builder and then upload to private builder"
  type        = list
}

variable "docker_host_prod_ip" {
  description = "The ip address of the docker host prod instance"
  type        = string
}

variable "docker_host_dev_ip" {
  description = "The ip address of the docker host dev instance"
  type        = string
}

variable "azure_agent_ip" {
  description = "The ip address of the azure agent instance"
  type        = string
}

variable "docker_host_user_name" {
  description = "The user name used to ssh to the docker hosts"
  type        = string
}

variable "docker_host_user_private_key" {
  description = "path to an ssh private key to access the docker hosts"
  type        = string
}

variable "chef_ssl_path" {
  description = "If using a builder with self signed certs, then a ca cert file will be created at this path that includes the self signed cert of the builder and the chef-clients ca bundle"
  type        = string
  default     = "/var/tmp/chef_ssl"
}

variable "chef_ssl_bundle_name" {
  description = "If using a builder with self signed certs, then a ca cert file will be created at this path that includes the self signed cert of the builder and the chef-clients ca bundle"
  type        = string
  default     = "bundle.pem"
}
