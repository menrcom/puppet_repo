class roles::os::ironic::keystone {
  include roles::os::ironic::base
  class {
    '::ironic::keystone::auth':
      tenant                 => $::roles::os::ironic::base::ks_tenant,
      auth_name              => $::roles::os::ironic::base::ks_user,
      password               => $::roles::os::ironic::base::ks_pass,
      service_name           => $::roles::os::ironic::base::service_name,
      public_url             => $::roles::os::ironic::base::endpoint['public_url'],
      admin_url              => $::roles::os::ironic::base::endpoint['admin_url'],
      internal_url           => $::roles::os::ironic::base::endpoint['internal_url'],
      configure_endpoint     => true,
      region                 => $::roles::os::base::region,
      stage                  => 'setup_api_servers';
  }
}
