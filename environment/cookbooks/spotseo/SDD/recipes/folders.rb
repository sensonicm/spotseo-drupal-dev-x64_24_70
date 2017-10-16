#
# Cookbook:: SDD
# Recipe:: folders
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node['sdd']['sites']

  node['sdd']['sites'].each do |index, site|

    htdocs = defined?(site['vhost']['document_root']) ? site['vhost']['document_root'] : index

    if htdocs.start_with?('/')
      htdocs = htdocs[1..-1]
    end

    htdocs = 'var/www/' + htdocs
    htdocs = htdocs.split(%r{\/\s*})
    folder = '/'
    for i in (0..htdocs.length - 1)
      folder = folder + htdocs[i] + '/'
      index_file = folder + '/index.html'
      directory folder do
        action :create
      end
      file index_file do
        content "<html>This is a placeholder.</html>"
        mode '0644'
        action :create
      end
    end
  end
end

file File.join(File.dirname(node['apache']['docroot_dir']), 'index.html') do
  action :delete
end

file File.join(File.dirname(node['apache']['docroot_dir']), 'html/index.html') do
  action :delete
end
