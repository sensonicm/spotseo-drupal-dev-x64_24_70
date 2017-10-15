name 'SDD'
maintainer '@code SpotSeo'
maintainer_email 'code@spotseo.ru'
license 'GPL v3'
description 'Installs/Configures SDD'
long_description 'Installs/Configures SDD'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
supports 'ubuntu', '>= 16.04'
depends 'apt'
depends 'apache2'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/SDD/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/SDD'
