class openstack::workarounds::cinder(
  $keystone_tenant,
  $keystone_user,
  $keystone_password,
  $keystone_auth_uri,
  $keystone_identity_uri,
  $glance_api_servers,
) {
  cinder_config {
    'DEFAULT/state_path':
      value => '/var/lib/cinder';
    'DEFAULT/lock_path':
      value => '/var/lock/cinder';
    'keystone_authtoken/admin_tenant':
      value => $keystone_tenant;
    'keystone_authtoken/admin_user':
      value => $keystone_user;
    'keystone_authtoken/admin_password':
      value => $keystone_password;
    'keystone_authtoken/auth_uri':
      value => $keystone_auth_uri;
    'keystone_authtoken/identity_uri':
      value => $keystone_identity_uri;
  }
}
