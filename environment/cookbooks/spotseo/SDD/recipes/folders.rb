#
# Cookbook:: SDD
# Recipe:: folders
#
# Copyright:: 2017, @code SpotSeo.

if node['sdd']['sites']

  node['sdd']['sites'].each do |index, site|

    docroot = defined?(site['vhost']['document_root']) ? site['vhost']['document_root'] : index

    if docroot.start_with?('/')
      docroot = docroot[1..-1]
    end

    htdocs = 'var/www/' + docroot
    htdocs = htdocs.split(%r{\/\s*})
    folder = '/'
    for i in (0..htdocs.length - 1)
      folder = folder + htdocs[i] + '/'
      directory folder do
        mode '0775'
        action :create
      end
    end

    index_file = 'var/www/' + docroot + '/index.html'

    file index_file do
      content "<html>This is a placeholder for #{site['vhost']['url']}.</html>"
      mode '0664'
      action :create
      not_if { File.exists?(index_file) }
    end
  end
end

file File.join(File.dirname(node['apache']['docroot_dir']), 'index.html') do
  action :delete
end

file File.join(File.dirname(node['apache']['docroot_dir']), 'html/index.html') do
  mode '0664'
  action :delete
end
