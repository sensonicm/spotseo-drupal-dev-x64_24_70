#
# Cookbook:: SDD
# Recipe:: database
#
# Copyright:: 2017, The Authors, All Rights Reserved.

bash "enable_apache_module_authz_user" do
  user "root"
  code <<-EOH
  a2enmod authz_user
  EOH
  not_if { File.exists?("/etc/apache2/mods-enabled/authz_user") }
end

package "phpmyadmin" do
  action :install
end

apache_conf 'phpmyadmin' do
  enable false
end

apache_config 'phpmyadmin' do
  enable true
end
