#
# Cookbook Name:: yum-softwarecollections
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

Chef::Recipe.send(:include, YumSCL::Helper)

if yum_scl_use_os_native_package?(node['yum-scl']['prefer_os_package'],
                          node['yum-scl']['native_packages'])
  include_recipe "#{cookbook_name}::native_install"
else
  include_recipe "#{cookbook_name}::chef_install"
end
