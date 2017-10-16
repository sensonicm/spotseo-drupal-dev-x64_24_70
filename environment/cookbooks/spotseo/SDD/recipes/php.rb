#
# Cookbook:: SDD
# Recipe:: php
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node['SDD']['php']['php_install'].each do |pkg|
  package pkg do
    action :install
  end
end

template "#{node['SDD']['php']['php_conf_dir']}/php.ini" do
  source node['SDD']['php']['ini']['template']
  cookbook node['SDD']['php']['ini']['cookbook']
  owner 'root'
  group 'root'
  mode '0644'
  manage_symlink_source true
  variables(directives: node['SDD']['php']['directives'])
  notifies :restart, 'service[apache2]', :delayed
end
