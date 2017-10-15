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

# Add vagrant to www-data group
#! group "www-data" do
#   action :modify
#   members "vagrant"
#   append true
# end

#! file File.join(File.dirname(node['apache']['docroot_dir']), 'index.html') do
#   action :delete
# end

#! link "/home/vagrant/sites" do
#   to "/var/www"
# end

web_app 'localhost_conf' do
  template 'localhost_conf.erb'
end
