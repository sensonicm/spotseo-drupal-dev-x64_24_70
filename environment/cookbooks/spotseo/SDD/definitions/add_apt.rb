#
# Cookbook:: SDD
# Definition:: add_apt
#

define :add_PPA, enable: true do
  conf_name = params[:name]
  if params[:enable]
    execute "add_PPA #{conf_name}" do
      command "/usr/bin/apt-add-repository #{conf_name}"
    end
    execute "apt update" do
    	command "/usr/bin/apt-get update"
    end
  end
end
