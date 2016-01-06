class roles::os::cinder::volume inherits roles::os::cinder::common {
  class {
    '::cinder::volume':
      enabled        => true,
      package_ensure => $::cinder::package_ensure,
      stage          => 'setup_api_servers';
    ['::openstack::cinder::volumes',
     '::cinder::backends']:
      stage          => 'setup_api_servers';
  }
}
