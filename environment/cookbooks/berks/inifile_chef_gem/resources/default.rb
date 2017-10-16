property :inifile_chef_gem_name, kind_of: String,
                                 name_attribute: true,
                                 required: true
property :gem_version, kind_of: String, default: '3.0.0'
property :client_version, kind_of: String, default: nil

actions :install, :remove

default_action :install

use_inline_resources if defined?(use_inline_resources)

action :install do
  include_recipe 'build-essential::default'

  gem_package 'inifile' do
    gem_binary RbConfig::CONFIG['bindir'] + '/gem'
    version new_resource.gem_version
    action :install
  end
end

action :remove do
  gem_package 'inifile' do
    gem_binary RbConfig::CONFIG['bindir'] + '/gem'
    action :remove
  end
end
