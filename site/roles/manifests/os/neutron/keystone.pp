class roles::os::neutron::keystone {
  include roles::os::neutron::base
  class {
    '::neutron::keystone::auth':
      tenant                 => $::roles::os::neutron::base::ks_tenant,
      auth_name              => $::roles::os::neutron::base::ks_user,
      password               => $::roles::os::neutron::base::ks_pass,
      service_name           => $::roles::os::neutron::base::service_name,
      public_url             => $::roles::os::neutron::base::endpoint['public_url'],
      admin_url              => $::roles::os::neutron::base::endpoint['admin_url'],
      internal_url           => $::roles::os::neutron::base::endpoint['internal_url'],
      configure_endpoint     => true,
      region                 => $::roles::os::base::region,
      stage                  => 'setup_api_servers';
  }
}
