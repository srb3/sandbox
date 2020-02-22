variable "ip" {
  description = "The ip address of the builder instance"
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

variable "hab_pkgs_linux" {
  description = "A list of linux pakages to download from public builder and then upload to private builder"
  type        = list
}

variable "hab_pkgs_win" {
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

variable "docker_host_user_name" {
  description = "The user name used to ssh to the docker hosts"
  type        = string
}

variable "docker_host_user_private_key" {
  description = "path to an ssh private key to access the docker hosts"
  type        = string
}
