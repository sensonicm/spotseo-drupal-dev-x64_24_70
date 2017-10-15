#
# configuration file for chef-solo
#

# fix notice about ssl
ssl_verify_mode :verify_peer

log_level :info
log_location STDOUT
file_cache_path '/vagrant/info/solo-cache'
file_backup_path '/vagrant/info/backup'
cookbook_path ['/vagrant/cookbooks/berks', '/vagrant/cookbooks/spotseo']
role_path '/vagrant/roles'
