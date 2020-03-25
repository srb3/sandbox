name 'builder_ssl'

default_source :supermarket, 'https://supermarket.chef.io'

run_list ["builder_populate::ssl_self_signed"]

cookbook 'builder_populate', path: '.'

default['builder_populate']['builder_ip'] = '10.0.1.8'
default['builder_populate']['chef_ssl_path'] = '/var/tmp/chef_ssl'
default['builder_populate']['chef_ssl_bundle_name'] = 'bundle.pem'
