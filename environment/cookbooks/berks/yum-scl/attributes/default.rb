default['yum-scl']['prefer_os_package'] = true

default['yum-scl']['enable_testing'] = false
default['yum-scl']['enable_source'] = false
default['yum-scl']['enable_debuginfo'] = false

default['yum-scl']['native_packages'] = value_for_platform(
  centos: {
    '>= 6.0'  => %w(centos-release-scl-rh centos-release-scl),
    'default' => nil
  },
  default: nil
)

default['yum-scl']['repos']['default'] = nil
