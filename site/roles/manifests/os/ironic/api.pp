class roles::os::ironic::api {
  include roles::os::ironic::base
  include roles::os::ironic::common
  class {
    '::ironic::api':
      enabled           => true,
      auth_uri          => $::roles::os::ironic::base::identity_uri,
      admin_tenant_name => $::roles::os::ironic::base::ks_tenant,
      admin_user        => $::roles::os::ironic::base::ks_user,
      admin_password    => $::roles::os::ironic::base::ks_pass,
      neutron_url       => $::roles::os::ironic::base::nw_endpoint['internal_url'],
      package_ensure    => $::ironic::ensure_package,
      stage             => 'setup_api_servers';
    '::ironic::conductor':
      enabled           => true,
      package_ensure    => $::ironic::ensure_package,
      stage             => 'setup_api_servers';
  }

}
