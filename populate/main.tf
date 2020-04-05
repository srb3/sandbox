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
  service = {
    "srb3/chef_docker_wrapper" = {}
  }
}

module "docker_host_prod" {
  source              = "srb3/habitat/chef"
  version             = "0.0.16"
  ips                 = [var.docker_host_prod_ip]
  instance_count      = 1
  user_name           = var.docker_host_user_name
  user_private_key    = var.docker_host_user_private_key
  hab_services        = local.service
  bldr_url            = "https://${var.builder_hostname}/bldr/v1"
  hab_service_channel = "stable"
  hab_sup_auto_update = true
  hab_sup_listen_ctl  = "0.0.0.0:9632"
}

module "docker_host_dev" {
  source              = "srb3/habitat/chef"
  version             = "0.0.16"
  ips                 = [var.docker_host_dev_ip]
  instance_count      = 1
  user_name           = var.docker_host_user_name
  user_private_key    = var.docker_host_user_private_key
  hab_services        = local.service
  bldr_url            = "https://${var.builder_hostname}/bldr/v1"
  hab_service_channel = "unstable"
  hab_sup_listen_ctl  = "0.0.0.0:9632"
  hab_sup_auto_update = true
}
