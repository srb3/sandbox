############ workstation output ############

output "workstation_ips" {
  value = module.workstation_base.server_public_ip
}

output "workstation_resource_group_names" {
  value = module.workstation_base.resource_group_names
}

output "workstation_fqdns" {
  value = module.workstation_base.public_ip_fqdn
}
