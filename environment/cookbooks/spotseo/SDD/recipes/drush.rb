#
# Cookbook:: SDD
# Recipe:: drush
#
# Copyright:: 2017, @code SpotSeo.

bash 'install-drush' do
  code <<-EOH
  mkdir /opt/drush
  cd /opt/drush
  composer init --require=drush/drush:8.1.6 -n
  composer config bin-dir /usr/local/bin
  composer install
  EOH
end

template '/opt/drush/vendor/drush/drush/drushrc.php' do
  source 'drushrc.php.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

if node['sdd']['sites']
  template '/opt/drush/vendor/drush/drush/aliases.drushrc.php' do
    source 'aliases.drushrc.php.erb'
    owner 'root'
    group 'root'
    mode '0644'
  end
end
