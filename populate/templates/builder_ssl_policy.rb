name 'builder_ssl'

default_source :supermarket, 'https://supermarket.chef.io'

run_list ["builder_populate::ssl_self_signed"]

cookbook 'builder_populate', path: '.'

default['builder_populate']['builder_ip'] = '${builder_ip}'
default['builder_populate']['chef_ssl_path'] = '${chef_ssl_path}'
default['builder_populate']['chef_ssl_bundle_name'] = '${chef_ssl_bundle_name}'
