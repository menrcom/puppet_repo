class roles::os::keystone::api {
  include roles::os::base
  $db_name = hiera('openstack::keystone::db::name', 'db_keystone')
  $db_user = hiera('openstack::keystone::db::user', 'user_keystone')
  $db_pass = hiera('openstack::keystone::db::pass')
  $db_host = hiera('openstack::keystone::db::host')

  $admin_email = hiera('openstack::keystone::admin::email')
  $admin_pass  = hiera('openstack::keystone::admin::password')
  $endpoint    = $::roles::os::base::endpoints['keystone']
  class {
    'keystone':
      catalog_type        => sql,
      database_connection => "mysql://${db_user}:${db_pass}@${db_host}/${db_name}",
      stage               => 'setup_api_servers';
    'keystone::roles::admin':
      email               => $admin_email,
      password            => $admin_pass,
      require             => Class['keystone'],
      stage               => 'setup_api_servers';
    'keystone::endpoint':
      public_url          => $endpoint['public_url'],
      admin_url           => $endpoint['admin_url'],
      internal_url        => $endpoint['internal_url'],
      region              => $::roles::os::base::region,
      require             => Class['keystone::roles::admin'],
      stage               => 'setup_api_servers';
    'openstack::users':
      require             => Class['keystone::roles::admin'],
      stage               => 'setup_api_servers';
  }

}
