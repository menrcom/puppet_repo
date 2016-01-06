class roles::os::glance::api {
  include roles::os::glance::base
  class {
    '::glance':
      stage               => 'setup_api_servers';
    '::glance::notify::rabbitmq':
      rabbit_hosts        => hiera('glance::rabbit_hosts'),
      rabbit_password     => hiera('glance::rabbit_password'),
      rabbit_userid       => hiera('glance::rabbit_userid'),
      rabbit_virtual_host => hiera('glance::rabbit_virtual_host'),
      stage               => 'setup_api_servers';
    '::glance::api':
      auth_uri            => $::roles::os::glance::base::auth_uri,
      identity_uri        => $::roles::os::glance::base::identity_uri,
      keystone_tenant     => $::roles::os::glance::base::ks_tenant,
      keystone_user       => $::roles::os::glance::base::ks_user,
      keystone_password   => $::roles::os::glance::base::ks_pass,
      database_connection => $::roles::os::glance::base::database_connection,
      os_region_name      => $::roles::os::base::region,
      validation_options  => $::roles::os::glance::base::validation_options,
      stage               => 'setup_api_servers';
    '::openstack::workarounds::glance_api':
      stage               => 'setup_api_servers';
    '::glance::registry':
      auth_uri            => $::roles::os::glance::base::auth_uri,
      identity_uri        => $::roles::os::glance::base::identity_uri,
      keystone_tenant     => $::roles::os::glance::base::ks_tenant,
      keystone_user       => $::roles::os::glance::base::ks_user,
      keystone_password   => $::roles::os::glance::base::ks_pass,
      database_connection => $::roles::os::glance::base::database_connection,
      stage               => 'setup_api_servers';
    '::glance::backend::file':
      stage               => 'setup_api_servers';
  }

}
