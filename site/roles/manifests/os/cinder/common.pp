class roles::os::cinder::common {
  include roles::os::cinder::base
  class {
    '::cinder':
      database_connection => $::roles::os::cinder::base::database_connection,
      package_ensure      => $::cinder::package_ensure,
      stage               => 'setup_api_servers';
    '::cinder::glance':
      stage               => 'setup_api_servers';
    '::openstack::workarounds::cinder':
      keystone_tenant     => $::roles::os::cinder::base::ks_tenant,
      keystone_user       => $::roles::os::cinder::base::ks_user,
      keystone_password   => $::roles::os::cinder::base::ks_pass,
      keystone_auth_uri   => $::roles::os::cinder::base::auth_uri,
      keystone_identity_uri => $::roles::os::cinder::base::identity_uri,
      glance_api_servers  => $::roles::os::cinder::base::glance_api_servers,
      stage               => 'setup_api_servers';
  }
}
