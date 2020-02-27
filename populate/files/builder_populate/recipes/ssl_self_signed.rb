extend BuilderPopulate::SslHelpers

ssl_dir = node['builder_populate']['chef_ssl_path']
ssl_bundle_name = node['builder_populate']['chef_ssl_bundle_name']

directory ssl_dir do
  owner 'root'
  group 'root'
  recursive true
end

x,y,z = i_p(node['builder_populate']['builder_ip'])

if ::File.readlines('/etc/hosts').grep(/#{z} #{x}/).size == 0
  ::File.write('/etc/hosts', "#{z} #{x}\n", ::File.size('/etc/hosts'), mode: 'a')
end

file "#{ssl_dir}/#{x}.crt" do
  content y
end

execute 'bundle' do
  command "cat $(dirname $(which chef-client))/../embedded/ssl/certs/cacert.pem #{ssl_dir}/#{x}.crt > #{ssl_dir}/#{ssl_bundle_name}"
end
