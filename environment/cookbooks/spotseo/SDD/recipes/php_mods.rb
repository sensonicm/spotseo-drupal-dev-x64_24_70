#
# Cookbook:: SDD
# Recipe:: php_mods
#
# Copyright:: 2017, @code SpotSeo.

mods = [
  'php-apcu',
  'php7.0-bcmath',
  'php7.0-bz2',
  'php7.0-dba',
  'php7.0-curl',
  'php7.0-gd',
  'php7.0-imap',
  'php7.0-intl',
  'php7.0-ldap',
  'php7.0-mbstring',
  'php7.0-mcrypt',
  'php7.0-mysql',
  'php7.0-pspell',
  'php7.0-recode',
  'php7.0-soap',
  'php7.0-xmlrpc',
  'php7.0-xsl',
  'php7.0-zip'
]

mods.each do |pkg|
  package pkg do
    action :install
    notifies :restart, 'service[apache2]', :delayed
  end
end
