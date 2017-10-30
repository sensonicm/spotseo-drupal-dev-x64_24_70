#
# Cookbook:: SDD
# Recipe:: uploadprogress
#
# Copyright:: 2017, @code SpotSeo.

add_PPA "#{node['SDD']['apt']['ppa_repo']}" do
  enable true
end

include_recipe 'apt'

package 'php-uploadprogress' do
  action :install
end
