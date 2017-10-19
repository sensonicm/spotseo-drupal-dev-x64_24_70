#
# Cookbook:: SDD
# Recipe:: info
#
# Copyright:: 2017, The Authors, All Rights Reserved.

template '/var/www/html/index.html' do
  source 'info.html.erb'
  mode '0644'
  variables(
    :sites => node["sdd"]["sites"]
  )
  action :create
end

phpinfo_loc = File.join(node['apache']['docroot_dir'], 'phpinfo.php')

bash "phpinfo" do
  code <<-EOH
  echo "<?php phpinfo();" > #{phpinfo_loc}
  EOH
  not_if { File.exists?(phpinfo_loc) }
end
