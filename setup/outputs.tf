############ chef automate output ############

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

############ prod db output ############

output "geoapp_db_connection_string" {
  value = module.sql_database.connection_string
}

output "geoapp_db_database_name" {
  value = module.sql_database.database_name
}

output "geoapp_db_sql_server_fqdn" {
  value = module.sql_database.sql_server_fqdn
}

output "geoapp_db_sql_server_location" {
  value = module.sql_database.sql_server_location
}

output "geoapp_db_sql_server_name" {
  value = module.sql_database.sql_server_name
}

output "geoapp_db_sql_server_version" {
  value = module.sql_database.sql_server_version
}

############ dev db output ############

output "geoapp_db_connection_string" {
  value = module.sql_database_dev.connection_string
}

output "geoapp_db_database_name" {
  value = module.sql_database_dev.database_name
}

output "geoapp_db_sql_server_fqdn" {
  value = module.sql_database_dev.sql_server_fqdn
}

output "geoapp_db_sql_server_location" {
  value = module.sql_database_dev.sql_server_location
}

output "geoapp_db_sql_server_name" {
  value = module.sql_database_dev.sql_server_name
}

output "geoapp_db_sql_server_version" {
  value = module.sql_database.sql_server_version
}

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

############ docker host output ############

output "docker_host_ips" {
  value = module.docker_host_base.server_public_ip
}

output "docker_host_resource_group_names" {
  value = module.docker_host_base.resource_group_names
}

output "docker_host_fqdns" {
  value = module.docker_host_base.public_ip_fqdn
}

