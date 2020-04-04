name 'builder_populate'

default_source :supermarket, 'https://supermarket.chef.io'

run_list ["builder_populate::default"]

cookbook 'builder_populate', path: '.'

default['builder_populate']['builder_ip'] = '${builder_ip}'
default['builder_populate']['public_auth_token'] = '${public_auth_token}'
default['builder_populate']['private_auth_token'] = '${private_auth_token}'
default['builder_populate']['hab_packages_linux_stable'] = ${jsonencode(hab_pkgs_linux_stable)}
default['builder_populate']['hab_packages_win_stable'] = ${jsonencode(hab_pkgs_win_stable)}
default['builder_populate']['hab_packages_linux_unstable'] = ${jsonencode(hab_pkgs_linux_unstable)}
default['builder_populate']['hab_packages_win_unstable'] = ${jsonencode(hab_pkgs_win_unstable)}
default['builder_populate']['fqdn'] = '${builder_hostname}'
