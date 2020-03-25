output "geoapp_db_connection_string_prod" {
  value = module.sql_database_prod.connection_string
}

output "geoapp_db_database_name_prod" {
  value = module.sql_database_prod.database_name
}

output "geoapp_db_sql_server_fqdn_prod" {
  value = module.sql_database_prod.sql_server_fqdn
}

output "db_admin_username_prod" {
  value = var.db_admin_username_prod
}

output "db_admin_password_prod" {
  value = var.db_admin_password_prod
}

########### chef automate output #################

output "chef_automate_public_ip" {
  value = module.chef_automate_base.server_public_ip
}

output "chef_automate_private_ip" {
  value = module.chef_automate_base.server_private_ip
}

output "chef_automate_public_hostname" {
  value = module.chef_automate_base.public_ip_fqdn
}

output "chef_automate_url" {
  value = module.chef_automate.url
}

########### workstation output ##################

output "chef_workstation_public_ip" {
  value = module.workstation_base.server_public_ip
}

output "chef_worksation_private_ip" {
  value = module.workstation_base.server_private_ip
}

output "chef_workstation_hostname" {
  value = module.workstation_base.public_ip_fqdn
}

########### docker hosts output ##################

output "docker_host_public_ip" {
  value = module.docker_host_base.server_public_ip
}

output "docker_host_private_ip" {
  value = module.docker_host_base.server_private_ip
}

output "docker_host_hostname" {
  value = module.docker_host_base.public_ip_fqdn
}

########### azure agent output ##################

output "azure_agent_public_ip" {
  value = module.azure_agent_base.server_public_ip
}

output "azure_agent_private_ip" {
  value = module.azure_agent_base.server_private_ip
}

output "azure_agent_hostname" {
  value = module.azure_agent_base.public_ip_fqdn
}
