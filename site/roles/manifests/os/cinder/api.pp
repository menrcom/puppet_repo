class roles::os::cinder::api inherits roles::os::cinder::common {
  class {
    '::cinder::api':
      enabled           => true,
      auth_uri          => $::roles::os::cinder::base::auth_uri,
      identity_uri      => $::roles::os::cinder::base::identity_uri,
      keystone_tenant   => $::roles::os::cinder::base::ks_tenant,
      keystone_user     => $::roles::os::cinder::base::ks_user,
      keystone_password => $::roles::os::cinder::base::ks_pass,
      package_ensure    => $::cinder::package_ensure,
      os_region_name    => $::roles::os::base::region,
      stage             => 'setup_api_servers';
    '::cinder::scheduler':
      enabled           => true,
      package_ensure    => $::cinder::package_ensure,
      stage             => 'setup_api_servers';
  }

}
