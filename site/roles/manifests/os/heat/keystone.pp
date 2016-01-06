class roles::os::heat::keystone {
  include roles::os::heat::base
  $public_url   = "${::roles::os::heat::base::endpoint['public_url']}/v1/%(tenant_id)s"
  $admin_url    = "${::roles::os::heat::base::endpoint['admin_url']}/v1/%(tenant_id)s"
  $internal_url = "${::roles::os::heat::base::endpoint['internal_url']}/v1/%(tenant_id)s"
  class {
    '::heat::keystone::auth':
      tenant                 => $::roles::os::heat::base::ks_tenant,
      auth_name              => $::roles::os::heat::base::ks_user,
      password               => $::roles::os::heat::base::ks_pass,
      service_name           => $::roles::os::heat::base::service_name,
      public_url             => $public_url,
      admin_url              => $admin_url,
      internal_url           => $internal_url,
      configure_endpoint     => true,
      region                 => $::roles::os::base::region,
      stage                  => 'setup_api_servers';
  }
}
