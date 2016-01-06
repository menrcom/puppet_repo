class roles::os::heat::common {
  class {
    '::heat':
      auth_uri            => $::roles::os::heat::base::auth_uri,
      identity_uri        => $::roles::os::heat::base::identity_uri,
      keystone_ec2_uri    => $::roles::os::heat::base::ec2auth_uri,
      keystone_tenant     => $::roles::os::heat::base::ks_tenant,
      keystone_user       => $::roles::os::heat::base::ks_user,
      keystone_password   => $::roles::os::heat::base::ks_pass,
      database_connection => $::roles::os::heat::base::database_connection,
      region_name         => $::roles::os::base::region,
      stage               => 'setup_api_servers';
    '::heat::keystone::domain':
      require             => Class['::heat'],
      stage               => 'setup_api_servers';
  }
}
