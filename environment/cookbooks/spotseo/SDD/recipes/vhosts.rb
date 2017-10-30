#
# Cookbook:: SDD
# Recipe:: vhosts
#
# Copyright:: 2017, @code SpotSeo.

apache_conf 'custom_settings' do
  enable false
end

apache_config 'custom_settings' do
  enable true
end

web_app 'localhost' do
  template 'localhost.erb'
end

service 'networking' do
  supports :restart => true, :start => true, :stop => true
  action :nothing
end

template '/etc/hosts' do
  source 'hosts.erb'
  owner 'root'
  group 'root'
  notifies :restart, 'service[networking]', :delayed
end
