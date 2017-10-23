#
# Cookbook:: SDD
# Recipe:: vhosts
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apache_conf 'custom_settings' do
  enable false
end

apache_config 'custom_settings' do
  enable true
end

web_app 'localhost_conf' do
  template 'localhost_conf.erb'
end
