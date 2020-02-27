default['builder_populate']['dir'] = '/root/src'
default['builder_populate']['hab_file_linux_stable'] = "#{node['builder_populate']['dir']}/on-prem-builder-master/hab_file_linux_stable"
default['builder_populate']['hab_file_win_stable'] = "#{node['builder_populate']['dir']}/on-prem-builder-master/hab_file_win_stable"

default['builder_populate']['hab_file_linux_unstable'] = "#{node['builder_populate']['dir']}/on-prem-builder-master/hab_file_linux_unstable"
default['builder_populate']['hab_file_win_unstable'] = "#{node['builder_populate']['dir']}/on-prem-builder-master/hab_file_win_unstable"


default['builder_populate']['private_auth_token'] = nil
default['builder_populate']['public_auth_token'] = nil
default['builder_populate']['builder_ip'] = nil


default['builder_populate']['hab_packages_linux_stable'] = []
default['builder_populate']['hab_packages_win_stable'] = []

default['builder_populate']['hab_packages_linux_unstable'] = []
default['builder_populate']['hab_packages_win_unstable'] = []

default['builder_populate']['chef_ssl_path'] = '/var/tmp/chef_ssl'
default['builder_populate']['chef_ssl_bundle_name'] = 'bundle.pem'
