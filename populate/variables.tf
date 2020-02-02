variable "builder_ip" {
  description = "The ip address of the builder instance"
  type        = string
}

variable "builder_ssh_user" {
  description = "The user name used to ssh to the builder instace"
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

variable "hab_pkgs" {
  description = "A list of pakages to download from public builder and then upload to private builder"
  type        = list
}
