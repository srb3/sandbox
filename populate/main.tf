locals {
  builder_ip = var.builder_private_ip != "" ? var.builder_private_ip : var.builder_public_ip
  policy = templatefile("${path.module}/templates/builder_populate_policy.rb", {
    builder_ip              = local.builder_ip,
    public_auth_token       = var.public_auth_token,
    private_auth_token      = var.private_auth_token,
    hab_pkgs_linux_stable   = var.hab_pkgs_linux_stable,
    hab_pkgs_win_stable     = var.hab_pkgs_win_stable,
    hab_pkgs_linux_unstable = var.hab_pkgs_linux_unstable,
    hab_pkgs_win_unstable   = var.hab_pkgs_win_unstable,
    builder_hostname        = var.builder_hostname
  })
  policy_ssl = templatefile("${path.module}/templates/builder_ssl_policy.rb", {
    builder_ip           = local.builder_ip,
    chef_ssl_path        = var.chef_ssl_path,
    chef_ssl_bundle_name = var.chef_ssl_bundle_name
  })
}

resource "local_file" "builder_populate_policy_file" {
  content = local.policy
  filename = "${path.module}/files/builder_populate/Policyfile.rb"
}

resource "null_resource" "builder_populate" {

  triggers = {
    policyfile = md5(local.policy) 
  }

  depends_on = [local_file.builder_populate_policy_file]

  provisioner "local-exec" {
    command = "${var.chef_cmd} ssh://${var.ssh_user}@${var.builder_public_ip} files/builder_populate --identity-file ${var.ssh_private_key_path} --chef-license accept"
  }

}

locals {
  docker_services = {
    "srb3/chef_docker_wrapper" = {},
    "srb3/telegraf-docker/1.14.0" = {
      "bind" = "backend:influxdb.monit",
      "group" = "monit"
    }
  }
}

module "docker_host_prod" {
  source              = "srb3/habitat/chef"
  version             = "0.0.16"
  ips                 = [var.docker_host_prod_ip]
  instance_count      = 1
  user_name           = var.docker_host_user_name
  user_private_key    = var.docker_host_user_private_key
  hab_services        = local.docker_services
  bldr_url            = "https://${var.builder_hostname}/bldr/v1"
  hab_service_channel = "stable"
  hab_sup_auto_update = true
  hab_sup_listen_ctl  = "0.0.0.0:9632"
  hab_sup_peers       = [var.azure_agent_ip, var.docker_host_prod_ip, var.docker_host_dev_ip]
}

module "docker_host_dev" {
  source              = "srb3/habitat/chef"
  version             = "0.0.16"
  ips                 = [var.docker_host_dev_ip]
  instance_count      = 1
  user_name           = var.docker_host_user_name
  user_private_key    = var.docker_host_user_private_key
  hab_services        = local.docker_services
  bldr_url            = "https://${var.builder_hostname}/bldr/v1"
  hab_service_channel = "unstable"
  hab_sup_listen_ctl  = "0.0.0.0:9632"
  hab_sup_auto_update = true
  hab_sup_peers       = [var.azure_agent_ip, var.docker_host_prod_ip, var.docker_host_dev_ip]
}

locals {
  agent_services = {
    "smartb/influxdb" = {
      "group" = "monit"
    },
    "srb3/showcase-grafana" = {
      "group" = "monit",
      "user_toml_config" = {
        "portocol" = "http",
        "datasource" = {
          "name" = "influxdb",
          "type" = "influxdb",
          "password" = "password",
          "url" = "http://localhost:8086"
          "user"     = "admin",
          "database" = "telegraf"
        }
      }
    }
  }
}

module "agent_monitoring" {
  source              = "srb3/habitat/chef"
  version             = "0.0.16"
  ips                 = [var.azure_agent_ip]
  instance_count      = 1
  user_name           = var.docker_host_user_name
  user_private_key    = var.docker_host_user_private_key
  hab_services        = local.agent_services
  bldr_url            = "https://${var.builder_hostname}/bldr/v1"
  hab_service_channel = "stable"
  hab_sup_auto_update = true
  hab_sup_listen_ctl  = "0.0.0.0:9632"
  hab_sup_peers       = [var.azure_agent_ip, var.docker_host_prod_ip, var.docker_host_dev_ip]
}
