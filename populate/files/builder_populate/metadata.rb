name 'builder_populate'
maintainer 'Steve Brown'
maintainer_email 'sbrown@chef.io'
license 'Apache-2.0'
description 'Installs/Configures builder_populate'
long_description 'Installs/Configures builder_populate'
version '0.1.0'
chef_version '>= 14.0'

%w(centos).each do |os|
  supports os
end


issues_url 'https://github.com/devoptimist/builder_populate/issues'
source_url 'https://github.com/devoptimist/builder_populate'
