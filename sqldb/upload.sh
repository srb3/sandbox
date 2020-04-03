#!/bin/bash

function get_prop() {
  awk "/$1/{print \$3}" terraform.tfvars  | sed 's/"//g'
}

function get_state_prop() {
  awk '/storage_account_access_key/{print $2}' terraform.tfstate | sed 's/"//g'| sed 's/,//g'
}

RESOURCE_GROUP_NAME=$(get_prop resource_group_name)
RESOURCE_GROUP_LOCATION=$(get_prop resource_group_location)
STORAGE_ACCOUNT_NAME=$(get_prop storage_account_name)
STORAGE_CONTAINER_NAME=$(get_prop storage_container_name)
FILE_NAME=$(get_prop application_file_name)
FILE_LOC=$(get_prop application_file_location)
FILE_ALT_NAME="geocoding-app-1.2.0.jar"

export AZURE_STORAGE_ACCOUNT=${STORAGE_ACCOUNT_NAME}
export AZURE_STORAGE_KEY=$(get_state_prop storage_account_access_key)
az storage blob upload -f ${FILE_LOC}/${FILE_NAME} -c ${STORAGE_CONTAINER_NAME} -n ${FILE_ALT_NAME}
