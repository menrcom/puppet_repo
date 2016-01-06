class roles::os::nova::keystone {
  include roles::os::nova::base
  $public_url   = "${::roles::os::nova::base::endpoint['public_url']}/v2/%(tenant_id)s"
  $admin_url    = "${::roles::os::nova::base::endpoint['admin_url']}/v2/%(tenant_id)s"
  $internal_url = "${::roles::os::nova::base::endpoint['internal_url']}/v2/%(tenant_id)s"
  class {
    '::nova::keystone::auth':
      tenant                 => $::roles::os::nova::base::ks_tenant,
      auth_name              => $::roles::os::nova::base::ks_user,
      auth_name_v3           => $::roles::os::nova::base::ks_user,
      password               => $::roles::os::nova::base::ks_pass,
      service_name           => $::roles::os::nova::base::service_name,
      service_name_v3        => "${::roles::os::nova::base::service_name}v3",
      public_url             => $public_url,
      admin_url              => $admin_url,
      internal_url           => $internal_url,
      configure_endpoint     => true,
      configure_endpoint_v3  => false,
      configure_ec2_endpoint => false,
      region                 => $::roles::os::base::region,
      stage                  => 'setup_api_servers';
    # '::openstack::endpoints::nova':
    #   service_name        => $::roles::os::nova::base::service_name,
    #   public_url          => $::roles::os::nova::base::endpoint['public_url'],
    #   admin_url           => $::roles::os::nova::base::endpoint['admin_url'],
    #   internal_url        => $::roles::os::nova::base::endpoint['internal_url'],
    #   region              => $::roles::os::base::region,
    #   stage               => 'setup_api_servers';
  }
}
