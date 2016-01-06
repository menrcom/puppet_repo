class roles::os::nova::api {
  include roles::os::nova::base
  include roles::os::nova::common
  class {
    '::nova::api':
      enabled           => true,
      auth_uri          => $::roles::os::nova::base::auth_uri,
      identity_uri      => $::roles::os::nova::base::identity_uri,
      admin_tenant_name => $::roles::os::nova::base::ks_tenant,
      admin_user        => $::roles::os::nova::base::ks_user,
      admin_password    => $::roles::os::nova::base::ks_pass,
      ensure_package    => $::nova::ensure_package,
      stage             => 'setup_api_servers';
    '::nova::vncproxy':
      enabled           => true,
      ensure_package    => $::nova::ensure_package,
      stage             => 'setup_api_servers';
    '::nova::consoleauth':
      enabled           => true,
      ensure_package    => $::nova::ensure_package,
      stage             => 'setup_api_servers';
    '::nova::serialproxy':
      enabled           => true,
      ensure_package    => $::nova::ensure_package,
      stage             => 'setup_api_servers';
  }

}
