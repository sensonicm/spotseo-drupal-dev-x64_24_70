#
# Cookbook:: SDD
# Recipe:: composer
#
# Copyright:: 2017, @code SpotSeo.

bash 'install-composer' do
  code <<-EOH
  curl -sS https://getcomposer.org/installer | php
  mv composer.phar /usr/local/bin/composer
  EOH
end
