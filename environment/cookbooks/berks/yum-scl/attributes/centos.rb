default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh']['repositoryid'] = 'centos-sclo-rh'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh']['description'] =
  "CentOS-#{node['platform_version'].to_i} - SCLo rh"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh']['baseurl'] =
  "http://mirror.centos.org/centos/#{node['platform_version'].to_i}/sclo/$basearch/rh/"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh']['gpgcheck'] = true
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh']['gpgkey'] = 'RPM-GPG-KEY-CentOS-SIG-SCLo'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh']['enabled'] = true

default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-testing']['repositoryid'] = 'centos-sclo-rh-testing'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-testing']['description'] =
  "CentOS-#{node['platform_version'].to_i} - SCLo rh Testing"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-testing']['baseurl'] =
  "http://buildlogs.centos.org/centos/#{node['platform_version'].to_i}/sclo/$basearch/rh/"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-testing']['gpgcheck'] = false
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-testing']['gpgkey'] = 'RPM-GPG-KEY-CentOS-SIG-SCLo'

default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-testing']['enabled'] =
  default['yum-scl']['enable_testing']

default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-source']['repositoryid'] = 'centos-sclo-rh-source'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-source']['description'] =
  "CentOS-#{node['platform_version'].to_i} - SCLo rh Sources"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-source']['baseurl'] =
  "http://buildlogs.centos.org/centos/#{node['platform_version'].to_i}/sclo/Source/rh/"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-source']['gpgcheck'] = true
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-source']['gpgkey'] = 'RPM-GPG-KEY-CentOS-SIG-SCLo'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-source']['enabled'] =
  default['yum-scl']['enable_source']

default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-debuginfo']['repositoryid'] =
  'centos-sclo-rh-debuginfo'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-debuginfo']['description'] =
  "CentOS-#{node['platform_version'].to_i} - SCLo rh Debuginfo"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-debuginfo']['baseurl'] =
  "http://buildlogs.centos.org/centos/#{node['platform_version'].to_i}/sclo/Source/rh/"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-debuginfo']['gpgcheck'] = true
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-debuginfo']['gpgkey'] =
  'RPM-GPG-KEY-CentOS-SIG-SCLo'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-rh-debuginfo']['enabled'] =
  default['yum-scl']['enable_debuginfo']

default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo']['repositoryid'] = 'centos-sclo-sclo'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo']['description'] =
  "CentOS-#{node['platform_version'].to_i} - SCLo"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo']['baseurl'] =
  "http://mirror.centos.org/centos/#{node['platform_version'].to_i}/sclo/$basearch/sclo/"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo']['gpgcheck'] = true
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo']['gpgkey'] = 'RPM-GPG-KEY-CentOS-SIG-SCLo'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo']['enabled'] = true

default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-testing']['repositoryid'] = 'centos-sclo-sclo-testing'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-testing']['description'] =
  "CentOS-#{node['platform_version'].to_i} - SCLo Testing"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-testing']['baseurl'] =
  "http://mirror.centos.org/centos/#{node['platform_version'].to_i}/sclo/$basearch/sclo/"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-testing']['gpgcheck'] = false
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-testing']['gpgkey'] = 'RPM-GPG-KEY-CentOS-SIG-SCLo'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-testing']['enabled'] =
  default['yum-scl']['enable_testing']

default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-source']['repositoryid'] = 'centos-sclo-sclo-source'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-source']['description'] =
  "CentOS-#{node['platform_version'].to_i} - SCLo Sources"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-source']['baseurl'] =
  "http://mirror.centos.org/centos/#{node['platform_version'].to_i}/sclo/$basearch/sclo/"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-source']['gpgcheck'] = true
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-source']['gpgkey'] = 'RPM-GPG-KEY-CentOS-SIG-SCLo'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-source']['enabled'] =
  default['yum-scl']['enable_source']

default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-debuginfo']['repositoryid'] =
  'centos-sclo-sclo-debuginfo'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-debuginfo']['description'] =
  "CentOS-#{node['platform_version'].to_i} - SCLo Debuginfo"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-debuginfo']['baseurl'] =
  "http://mirror.centos.org/centos/#{node['platform_version'].to_i}/sclo/$basearch/sclo/"
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-debuginfo']['gpgcheck'] = true
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-debuginfo']['gpgkey'] = 'RPM-GPG-KEY-CentOS-SIG-SCLo'
default['yum-scl']['repos']['centos']['>=6.0']['centos-sclo-sclo-debuginfo']['enabled'] =
  default['yum-scl']['enable_debuginfo']

default['yum-scl']['repos']['centos']['default'] = nil
