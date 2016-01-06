class roles::os::nova::common {
  $identity_uri = "${::roles::os::nova::base::ks_endpoint['admin_url']}/v2.0"
  package { ['python-memcache']: ensure => latest; }
  class {
    '::nova':
      database_connection => $::roles::os::nova::base::database_connection,
      os_region_name      => $::roles::os::base::region,
      stage               => 'setup_api_servers';
    '::nova::network::neutron':
      neutron_admin_password => $::roles::os::nova::base::ks_nw_pass,
      neutron_admin_username => $::roles::os::nova::base::ks_nw_user,
      neutron_admin_tenant_name => $::roles::os::nova::base::ks_nw_tenant,
      neutron_admin_auth_url => $identity_uri,
      neutron_url         => $::roles::os::nova::base::nw_endpoint['admin_url'],
      neutron_region_name => $::roles::os::base::region,
      stage               => 'setup_api_servers';
  }
}
