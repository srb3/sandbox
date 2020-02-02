locals {
  policy = templatefile("${path.module}/templates/builder_populate_policy.rb", {
    builder_ip = var.builder_ip,
    public_auth_token = var.public_auth_token,
    private_auth_token = var.private_auth_token,
    hab_pkgs = var.hab_pkgs
  })
}

resource "local_file" "builder_populate_policy_file" {
  content = local.policy
  filename = "${path.module}/cookbooks/builder_populate/Policyfile.rb"
}

resource "null_resource" "builder_populate" {

  triggers = {
    policyfile = md5(local.policy) 
  }

  depends_on = ["local_file.builder_populate_policy_file"]

  provisioner "local-exec" {
    command = "chef-run ssh://${var.builder_ssh_user}@${var.builder_ip} cookbooks/builder_populate"
  }

}
