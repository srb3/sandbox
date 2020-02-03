locals {
  policy = templatefile("${path.module}/templates/builder_populate_policy.rb", {
    builder_ip = var.ip,
    public_auth_token = var.public_auth_token,
    private_auth_token = var.private_auth_token,
    hab_pkgs = var.hab_pkgs
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
    command = "chef-run ssh://${var.ssh_user}@${var.ip} files/builder_populate --identity-file ${var.ssh_private_key_path}"
  }

}
