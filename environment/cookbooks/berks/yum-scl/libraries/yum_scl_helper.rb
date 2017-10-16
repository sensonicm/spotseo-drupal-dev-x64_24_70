# YumSCL is a module containing yum-softwarecollections cookbook helper
module YumSCL
  # Helper module for yum-softwarecollections cookbook
  module Helper
    def yum_scl_use_os_native_package?(prefer_os, packages_list)
      return false unless prefer_os
      if packages_list.nil?
        Chef::Log.warn 'prefer_os_package detected, but no softwarecollections'\
                       " package available on #{node['platform']}-"\
                       "#{node['platform_version']}. Fall back to use attribute"\
                       ' specified repositories.'
        return false
      end
      true
    end

    def yum_scl_enable_repo(repository_name, enabled)
      shell_out!('yum-config-manager', enabled ? '--enable' : '--disable', repository_name)
    end

    def yum_scl_package_repo_files(package_name)
      yum_scl_package_files(package_name, %r{^/etc/yum.repos.d/.+.repo$})
    end

    def yum_scl_package_files(package_name, file_mask = /.*/)
      matched_files = []
      shell_out!('rpm', '-q', '-l', package_name).stdout.chomp.split("\n").each do |package_file|
        matched_files.push(package_file) if file_mask.match(package_file)
      end
      matched_files
    end
  end
end
