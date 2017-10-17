#
# Cookbook:: SDD
# Recipe:: database
#
# Copyright:: 2017, The Authors, All Rights Reserved.

service 'mysql' do
  supports :restart => true, :start => true, :stop => true
  action :nothing
end

template '/etc/mysql/conf.d/20-innodb.cnf' do
  source 'sdd_20-innodb.cnf.erb'
  mode '0644'
  notifies :restart, 'service[mysql]', :delayed
end

package 'phpmyadmin' do
  action :install
end

apache_conf 'phpmyadmin' do
  enable false
end

apache_config 'phpmyadmin' do
  enable true
end
