output "chef_automate_ips" {
  value = module.chef_automate_base.server_public_ip
}

output "chef_automate_resource_group_names" {
  value = module.chef_automate_base.resource_group_names
}

output "chef_atuoamte_fqdns" {
  value = module.chef_automate_base.public_ip_fqdn
}

output "chef_atuoamte_dns_names" {
  value = module.chef_automate_base.public_ip_dns_name
}
