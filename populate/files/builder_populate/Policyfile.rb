name 'builder_populate'

default_source :supermarket, 'https://supermarket.chef.io'

run_list ["builder_populate::default"]
named_run_list :builder_ssl_fetch, "builder_populate::ssl_self_signed"

default['builder_populate']['builder_ip'] = '13.94.133.118'
cookbook 'builder_populate', path: '.'
