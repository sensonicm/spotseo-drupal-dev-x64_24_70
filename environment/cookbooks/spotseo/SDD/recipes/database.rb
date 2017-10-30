#
# Cookbook:: SDD
# Recipe:: database
#
# Copyright:: 2017, @code SpotSeo.

include_recipe 'mariadb'

group 'www-data' do
  action :modify
  members 'vagrant'
  append true
end

service 'mysql' do
  supports :restart => true, :start => true, :stop => true
  action :nothing
end

template '/etc/mysql/conf.d/20-innodb.cnf' do
  source 'sdd_20-innodb.cnf.erb'
  mode '0664'
  notifies :restart, 'service[mysql]', :delayed
end

package 'phpmyadmin' do
  action :install
end

bash 'blowfish_owner' do
  code <<-EOH
  chown vagrant:www-data /var/lib/phpmyadmin/blowfish_secret.inc.php
  EOH
end

bash 'conf_inc_owner' do
  code <<-EOH
  chown vagrant:www-data /var/lib/phpmyadmin/config.inc.php
  EOH
end

apache_conf 'phpmyadmin' do
  enable false
end

apache_config 'phpmyadmin' do
  enable true
end

mysql_cmd = mysqlbin_cmd(node['mariadb']['install']['prefer_scl_package'],
                         node['mariadb']['install']['version'],
                         'mysql')
execute 'update_mariadb_root_access' do
  command "/usr/bin/sudo #{mysql_cmd} -u root --password=" + \
    node['mariadb']['server_root_password'] + \
    " -e \"USE mysql;" \
    "UPDATE user SET plugin='mysql_native_password' WHERE User='root';" \
    "FLUSH PRIVILEGES;\""
  sensitive true
  not_if do
    cmd = Mixlib::ShellOut.new("#{mysql_cmd} -u root " \
                               '--password=' + \
                               node['mariadb']['server_root_password'] + \
                               " -B -N -e \"SELECT 1 " \
                               'FROM mysql.user ' \
                               "WHERE plugin = 'mysql_native_password'" \
                               "AND user = 'root';\"")
    cmd.run_command
    cmd.stdout.to_i == 1
  end
  notifies :restart, 'service[mysql]', :delayed
end

node['sdd']['sites'].each do |index, base|
  mysql_cmd = mysqlbin_cmd(node['mariadb']['install']['prefer_scl_package'],
                           node['mariadb']['install']['version'],
                           'mysql')
  execute 'update_mariadb_databases' do
    command "#{mysql_cmd} -u root --password=" + \
      node['mariadb']['server_root_password'] + \
      " -e \"CREATE DATABASE IF NOT EXISTS " + \
      base['database'] + \
      " CHARACTER SET utf8 COLLATE utf8_general_ci;" \
      "CREATE USER '" + \
      base['database'] + \
      "'@'localhost' IDENTIFIED BY '" + \
      base['database'] + \
      "';" \
      "GRANT ALL PRIVILEGES ON " + \
      base['database'] + \
      ".* TO '" + \
      base['database'] + \
      "'@'localhost' IDENTIFIED BY '" + \
      base['database'] + \
      "';" \
      "FLUSH PRIVILEGES;\""
      sensitive true
	    not_if do
        cmd = Mixlib::ShellOut.new("#{mysql_cmd} -u root " \
	                                 '--password=' + \
	                                 node['mariadb']['server_root_password'] + \
	                                 " -B -N -e \"SELECT 1 " \
	                                 'FROM mysql.user ' \
	                                 "WHERE user = '" + \
	                                 base['database'] + \
	                                 "';\"")
	      cmd.run_command
	      cmd.stdout.to_i == 1
	    end
      notifies :restart, 'service[mysql]', :delayed
  end
end
