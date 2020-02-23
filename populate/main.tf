locals {
  policy = templatefile("${path.module}/templates/builder_populate_policy.rb", {
    builder_ip = var.ip,
    public_auth_token = var.public_auth_token,
    private_auth_token = var.private_auth_token,
    hab_pkgs_linux = var.hab_pkgs_linux
    hab_pkgs_win   = var.hab_pkgs_win
  })
  policy_ssl = templatefile("${path.module}/templates/builder_ssl_policy.rb", {
    builder_ip = var.ip
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
    command = "/opt/chef-workstation/bin/chef-run ssh://${var.ssh_user}@${var.ip} files/builder_populate --identity-file ${var.ssh_private_key_path} --chef-license accept"
  }

}

resource "local_file" "builder_ssl_policy_file" {
  depends_on = [null_resource.builder_populate]

  content = local.policy_ssl
  filename = "${path.module}/files/builder_populate/Policyfile.rb"
}

resource "null_resource" "ssl_fetch" {

  triggers = {
    policyfile = md5(local.policy_ssl)
  }

  depends_on = [local_file.builder_ssl_policy_file]

  provisioner "local-exec" {
    command = "/opt/chef-workstation/bin/chef-run ssh://${var.ssh_user}@${var.docker_host_prod_ip} files/builder_populate --identity-file ${var.ssh_private_key_path} --chef-license accept"
  }

  provisioner "local-exec" {
    command = "/opt/chef-workstation/bin/chef-run ssh://${var.ssh_user}@${var.docker_host_dev_ip} files/builder_populate --identity-file ${var.ssh_private_key_path} --chef-license accept"
  }
}

locals {
  service = {
    "srb3/chef_docker_wrapper" = {}
  }
}

module "docker_host_prod" {
  source              = "srb3/habitat/chef"
  version             = "0.0.9"
  ips                 = [var.docker_host_prod_ip]
  instance_count      = 1
  user_name           = var.docker_host_user_name
  user_private_key    = var.docker_host_user_private_key
  hab_services        = local.service
  bldr_url            = "https://${var.ip}/bldr"
  hab_service_channel = "stable"
  hab_sup_auto_update = true
  module_input        = null_resource.ssl_fetch.id
}

module "docker_host_dev" {
  source              = "srb3/habitat/chef"
  version             = "0.0.9"
  ips                 = [var.docker_host_dev_ip]
  instance_count      = 1
  user_name           = var.docker_host_user_name
  user_private_key    = var.docker_host_user_private_key
  hab_services        = local.service
  bldr_url            = "https://${var.ip}/bldr"
  hab_service_channel = "unstable"
  hab_sup_auto_update = true
  module_input        = null_resource.ssl_fetch.id
}
