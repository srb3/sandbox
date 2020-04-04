name 'builder_populate'

default_source :supermarket, 'https://supermarket.chef.io'

run_list ["builder_populate::default"]

cookbook 'builder_populate', path: '.'

default['builder_populate']['builder_ip'] = '10.0.1.8'
default['builder_populate']['public_auth_token'] = '_Qk9YLTEKYmxkci0yMDE3MDkyNzAyMzcxNApibGRyLTIwMTcwOTI3MDIzNzE0CjZDSHluUzRkQnBzOXN1amJYUTd2OEErb1dWVm5WTnRMCm5pK0JKVWFucmphM2dZdTdrcWVVZ3JpZDFWQitRK0NuUEdtelB6UFN4SlVIRHRmaA=='
default['builder_populate']['private_auth_token'] = '_Qk9YLTEKYmxkci0yMDIwMDMyMjE4NDUwMwpibGRyLTIwMjAwMzIyMTg0NTAzCjM5Si9EUjVvanJ6UlFqdjd0eks2Rk1SaWhRQWExc1hoCkY3dnJzWk5yNkdhYU1JUDAzeXZUVy9UdTN4cElvK3YxMDdvcnI1Zlk1RG5uNHYwNw=='
default['builder_populate']['hab_packages_linux_stable'] = ["srb3/chef_docker_wrapper","srb3/pets-app","core/maven","core/hab-studio/1.5.71","core/hab-studio/1.5.29","core/hab-studio/1.5.0","core/hab","core/hab/1.5.0","core/hab-sup/1.5.0","core/hab-launcher/13013","core/hab-sup","core/hab-launcher","core/openjdk11","srb3/openjdk11","core/hab-pkg-export-docker/1.5.71","core/vault"]
default['builder_populate']['hab_packages_win_stable'] = ["core/maven","core/hab","core/hab-sup","core/hab-launcher","core/hab/1.5.0","core/hab-sup/1.5.0","core/hab-launcher/13013","core/hab-studio/1.5.71","core/hab-studio/1.5.29","core/hab-studio/1.5.0","core/sqlserver","core/windows-service"]
default['builder_populate']['hab_packages_linux_unstable'] = ["srb3/chef_docker_wrapper","core/hab-backline/1.5.20","core/hab-sup/1.5.20","core/hab/1.5.20"]
default['builder_populate']['hab_packages_win_unstable'] = ["core/hab/1.5.20","core/hab-sup/1.5.21"]
default['builder_populate']['fqdn'] = 'chef-automate-uk.devoptimist.net'
