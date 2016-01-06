class roles::os::designate::keystone inherits roles::os::designate::base {
  class {
    '::designate::keystone::auth':
      tenant                 => $::roles::os::designate::base::ks_tenant,
      auth_name              => $::roles::os::designate::base::ks_user,
      password               => $::roles::os::designate::base::ks_pass,
      service_name           => $::roles::os::designate::base::service_name,
      public_url             => $endpoint['public_url'],
      admin_url              => $endpoint['admin_url'],
      internal_url           => $endpoint['internal_url'],
      configure_endpoint     => true,
      region                 => $::roles::os::base::region,
      stage                  => 'setup_api_servers';
  }
}
