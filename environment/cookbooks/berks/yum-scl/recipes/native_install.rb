
Chef::Recipe.send(:include, YumSCL::Helper)

inifile_chef_gem 'default' do
  action :install
end

package 'yum-utils' do
  action :install
end

node['yum-scl']['native_packages'].each do |package|
  # Install packages
  package package do
    action :install
  end
  # Enable/disable repositories
  ruby_block "Enable/disable repositories for #{package}" do
    block do
      Chef::Resource.send(:include, YumSCL::Helper)
      require 'inifile'
      yum_scl_package_repo_files(package).each do |repo_conf|
        %w(testing source debuginfo).each do |ext_repo|
          repo_ini = IniFile.load(repo_conf)
          matched_repos = repo_ini.sections.select do |repository_name|
            /^.+-#{ext_repo}$/.match(repository_name)
          end
          matched_repos.each do |repository_name|
            yum_scl_enable_repo(repository_name, node['yum-scl']["enable_#{ext_repo}"])
          end
        end
      end
    end
  end
end
