name 'SDD'
maintainer '@code SpotSeo'
maintainer_email 'code@spotseo.ru'
license 'GPL v3'
description 'Installs/Configures SDD'
long_description 'Installs SpotSeo Drupal Development environment on Ubuntu Xenial64 with Apache-2.4 + php-7.0'
version '1.0.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
supports 'ubuntu', '>= 16.04'
depends 'apt'
depends 'apache2'
depends 'mariadb'
source_url 'https://github.com/sensonicm/spotseo-drupal-dev-x64_24_70'
issues_url 'https://github.com/sensonicm/spotseo-drupal-dev-x64_24_70/issues'
