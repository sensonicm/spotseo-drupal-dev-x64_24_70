#
# Cookbook:: SDD
# Recipe:: info
#
# Copyright:: 2017, @code SpotSeo.

template '/var/www/html/index.html' do
  source 'info.html.erb'
  mode '0644'
  variables(
    :sites => node['sdd']['sites']
  )
  action :create
end

phpinfo_loc = File.join(node['apache']['docroot_dir'], 'phpinfo.php')

bash 'phpinfo' do
  code <<-EOH
  echo '<?php phpinfo();' > #{phpinfo_loc}
  EOH
  not_if { File.exists?(phpinfo_loc) }
end

testmail_loc = File.join(node['apache']['docroot_dir'], 'testmail.php')

template testmail_loc do
  source 'mail.php.erb'
  mode '0644'
  action :create
end
