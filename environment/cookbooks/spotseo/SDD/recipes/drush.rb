#
# Cookbook:: SDD
# Recipe:: drush
#
# Copyright:: 2017, The Authors, All Rights Reserved.

bash "install-drush" do
  code <<-EOH
  mkdir /opt/drush
  cd /opt/drush
  composer init --require=drush/drush:8.1.6 -n
  composer config bin-dir /usr/local/bin
  composer install
  EOH
end

template "/opt/drush/vendor/drush/drush/drushrc.php" do
  source "drushrc.php.erb"
  owner "root"
  group "root"
  mode "0644"
end
