#
# Cookbook:: SDD
# Attributes:: default
#

default['SDD']['php']['directives'] = {}
default['SDD']['php']['php_install'] = %w(php7.0 libapache2-mod-php7.0)
default['SDD']['php']['php_conf_dir'] = '/etc/php/7.0/apache2'
default['SDD']['php']['ini']['template'] = 'php_ini.erb'
default['SDD']['php']['ini']['cookbook'] = 'SDD'
default['SDD']['apt']['ppa_repo'] = 'ppa:ondrej/php'
