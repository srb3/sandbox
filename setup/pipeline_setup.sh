#!/bin/bash

echo -e $SSH_PUBLIC_KEY > ./tf.pub
echo -e $SSH_PRIVATE_KEY > ./tf


cat << EOF > ./terraform.tfvars
tags = {
  "customer" = "$CUSTOMER_NAME"
  "application" = "$APPLICATION"
  "ttl" = "$TTL"
  "project" = "$PROJECT"
  "dept" = "$DEPT"
  "contact" = "$CONTACT"
  "prefix" = "$PREFIX"
}

create_user = true
user_name = "$USERNAME"
user_public_key = "$SSH_PUBLIC_KEY_PATH"
user_private_key = "$SSH_PRIVATE_KEY_PATH"

resource_group_name = "$RESOURCE_GROUP_NAME"
resource_group_location = "$RESOURCE_GROUP_LOCATION"

address_space = "$ADDRESS_SPACE"

subnet_prefix = ["$SUBNET_PREFIX"]

subnet_names = ["$SUBNET_NAME"]

predefined_rules = [
  {
    name     = "SSH",
    priority = "100"
  },
  {
    name     = "HTTP"
    priority = "300"
  },
  {
    name     = "HTTPS"
    priority = "400"
  }
]

vm_size = "$VM_SIZE"
server_count = 1
vm_os_publisher = "$OS_PUBLISHER"
vm_os_offer = "$OS_OFFER"
vm_os_sku = "$OS_SKU"
vm_os_version = "$OS_VERSION"
allocation_method = "$ALLOCATION_METHOD"
nb_public_ip = "1"
delete_os_disk_on_termination = $DELETE_ON_TERMINATION
data_sa_type = "$STORAGE_ACCOUNT_TYPE"
data_disk_size_gb = "$DATA_DISK_SIZE"
data_disk = $DATA_DISK

chef_automate_license = "$CHEF_AUTOMATE_LICENSE"
chef_automate_admin_password = "$CHEF_AUTOMATE_ADMIN_PASSWORD"
chef_automate_hostname = "$CHEF_AUTOMATE_HOSTNAME"
chef_automate_version = "latest"
chef_automate_channel = "dev"
chef_automate_products = ["automate", "builder"]
data_collector_token = "$DATA_COLLECTOR_TOKEN"
EOF

terraform init
terraform version
terraform apply -auto-approve
