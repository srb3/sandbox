name 'builder_populate'

default_source :supermarket, 'https://supermarket.chef.io'

run_list ["builder_populate::default"]

cookbook 'builder_populate', path: '.'

default['builder_populate']['builder_ip'] = '${builder_ip}'
default['builder_populate']['public_auth_token'] = '${public_auth_token}'
default['builder_populate']['private_auth_token'] = '${private_auth_token}'
default['builder_populate']['hab_packages_linux'] = ${jsonencode(hab_pkgs_linux)}
default['builder_populate']['hab_packages_win'] = ${jsonencode(hab_pkgs_win)}
