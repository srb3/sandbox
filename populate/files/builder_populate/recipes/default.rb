#
# Cookbook:: builder_populate
# Recipe:: default
#
# Copyright:: 2019, Steve Brown
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

template node['builder_populate']['hab_file'] do
  source 'hab_file.erb'
end

template "#{node['builder_populate']['dir']}/on-prem-builder-master/download.sh" do
  source 'download.sh.erb'
end

template "#{node['builder_populate']['dir']}/on-prem-builder-master/upload.sh" do
  source 'upload.sh.erb'
end

execute 'dl' do
  cwd "#{node['builder_populate']['dir']}/on-prem-builder-master/"
  command 'bash download.sh'
  environment ({'HAB_AUTH_TOKEN' => node['builder_populate']['public_auth_token']})
end

execute 'ul' do
  cwd "#{node['builder_populate']['dir']}/on-prem-builder-master/"
  command 'bash upload.sh'
  environment ({'HAB_AUTH_TOKEN' => node['builder_populate']['private_auth_token']})
end
