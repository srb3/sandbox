name 'builder_ssl'

default_source :supermarket, 'https://supermarket.chef.io'

run_list ["builder_populate::ssl_self_signed"]

cookbook 'builder_populate', path: '.'

default['builder_populate']['builder_ip'] = '13.94.133.118'
