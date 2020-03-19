#!/bin/bash

function get_prop() {
  awk "/$1/{print \$3}" terraform.tfvars  | sed 's/"//g'
}

RESOURCE_GROUP_NAME=$(get_prop resource_group_name)
RESOURCE_GROUP_LOCATION=$(get_prop resource_group_location)

action=${1:-create}
rg_destroy=${2:-no}

if [ "$action" = "create" ]; then
  if ! az group show --name $RESOURCE_GROUP_NAME &>/dev/null; then
    echo "creating resource group $RESOURCE_GROUP_NAME"
    az group create --name $RESOURCE_GROUP_NAME --location "$RESOURCE_GROUP_LOCATION"
  fi
  terraform apply -auto-approve
else
  if [ "$rg_destroy" = "yes" ]; then
    if az group show --name $RESOURCE_GROUP_NAME &>/dev/null; then
      echo "destroying resource group $RESOURCE_GROUP_NAME"
      az group delete --name $RESOURCE_GROUP_NAME --yes
    fi
  fi
  terraform destroy -auto-approve
fi
