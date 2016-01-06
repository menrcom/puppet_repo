class roles::os::glance::keystone {
  include roles::os::glance::base
  class {
    '::glance::keystone::auth':
      tenant              => $::roles::os::glance::base::ks_tenant,
      auth_name           => $::roles::os::glance::base::ks_user,
      password            => $::roles::os::glance::base::ks_pass,
      service_name        => $::roles::os::glance::base::service_name,
      public_url          => $::roles::os::glance::base::endpoint['public_url'],
      admin_url           => $::roles::os::glance::base::endpoint['admin_url'],
      internal_url        => $::roles::os::glance::base::endpoint['internal_url'],
      configure_endpoint  => true,
      region              => $::roles::os::base::region,
      stage               => 'setup_api_servers';
    # '::openstack::endpoints::glance':
    #   service_name        => $::roles::os::glance::base::service_name,
    #   public_url          => $::roles::os::glance::base::endpoint['public_url'],
    #   admin_url           => $::roles::os::glance::base::endpoint['admin_url'],
    #   internal_url        => $::roles::os::glance::base::endpoint['internal_url'],
    #   region              => $::roles::os::base::region,
    #   stage               => 'setup_api_servers';
  }
}
