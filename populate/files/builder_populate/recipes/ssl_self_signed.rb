extend BuilderPopulate::SslHelpers

directory '/hab/cache/ssl/' do
  owner 'root'
  group 'root'
  recursive true
end

x,y,z = i_p(node['builder_populate']['builder_ip'])

if ::File.readlines('/etc/hosts').grep(/#{z} #{x}/).size == 0
  ::File.write('/etc/hosts', "#{z} #{x}\n", ::File.size('/etc/hosts'), mode: 'a')
end

file '/hab/cache/ssl/builder.crt' do
  content y
end
