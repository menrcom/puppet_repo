class roles::os::neutron::api {
  include roles::os::neutron::base
  include roles::os::neutron::common
  $nova_uri = "${::roles::os::neutron::base::nv_endpoint['internal_url']}/v2"
  $identity_uri = "${::roles::os::neutron::base::ks_endpoint['admin_url']}/v2.0"
  class {
    '::neutron::server':
      enabled        => true,
      sync_db        => true,
      auth_uri       => $::roles::os::neutron::base::auth_uri,
      identity_uri   => $::roles::os::neutron::base::identity_uri,
      auth_tenant    => $::roles::os::neutron::base::ks_tenant,
      auth_user      => $::roles::os::neutron::base::ks_user,
      auth_password  => $::roles::os::neutron::base::ks_pass,
      auth_region    => $::roles::os::base::region,
      database_connection => $::roles::os::neutron::base::database_connection,
      package_ensure => $::neutron::package_ensure,
      stage          => 'setup_api_servers';
    '::neutron::server::notifications':
      nova_url               => $nova_uri,
      nova_admin_auth_url    => $identity_uri,
      nova_admin_username    => $::roles::os::neutron::base::ks_nv_user,
      nova_admin_tenant_name => $::roles::os::neutron::base::ks_nv_tenant,
      nova_admin_password    => $::roles::os::neutron::base::ks_nv_pass,
      nova_region_name       => $::roles::os::base::region,
      stage                  => 'setup_api_servers';
  }

}
