############ chef automate output ############

output "chef_automate_ips" {
  value = module.chef_automate_base.server_public_ip
}

output "chef_atuoamte_dns_names" {
  value = module.chef_automate_base.public_ip_dns_name
}

############ prod db output ############

output "geoapp_db_connection_string_prod" {
  value = module.sql_database_prod.connection_string
}

output "geoapp_db_database_name_prod" {
  value = module.sql_database_prod.database_name
}

output "geoapp_db_sql_server_fqdn_prod" {
  value = module.sql_database_prod.sql_server_fqdn
}

############ dev db output ############

output "geoapp_db_connection_string_dev" {
  value = module.sql_database_dev.connection_string
}

output "geoapp_db_database_name_dev" {
  value = module.sql_database_dev.database_name
}

output "geoapp_db_sql_server_fqdn_dev" {
  value = module.sql_database_dev.sql_server_fqdn
}

############ workstation output ############

output "workstation_ips" {
  value = module.workstation_base.server_public_ip
}

output "workstation_fqdns" {
  value = module.workstation_base.public_ip_fqdn
}

############ docker host output ############

output "docker_host_ips" {
  value = module.docker_host_base.server_public_ip
}

output "docker_host_fqdns" {
  value = module.docker_host_base.public_ip_fqdn
}

