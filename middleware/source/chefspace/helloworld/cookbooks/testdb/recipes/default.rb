#
# Cookbook:: testdb
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_update 'daily' do
        frequency 86_400
        action :periodic
end

mysql_service 'default' do
  port '3306'
  initial_root_password 'test'
  action :create
end

template '/etc/init.d/mysql' do
  source 'mysql.erb'
  owner 'mysql'
  group 'mysql'
  mode '0755'
end


service 'mysql' do
  provider Chef::Provider::Service::Init
  supports status: true
  action [:start]
end
