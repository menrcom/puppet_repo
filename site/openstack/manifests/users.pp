class openstack::users($ensure = present) {
  Class['keystone::roles::admin'] ->
  Keystone_Tenant <| tag == 'openstack::users' |> ->
  Keystone_User <| tag == 'openstack::users' |> ->
  Keystone_Role <| tag == 'openstack::users' |> ->
  Keystone_User_role <| tag == 'openstack::users' |>

  keystone_tenant {
    ['admin_team']:
      ensure => $ensure,
      enabled => true;
  }

  # keystone_user {
  #   'admin_user':
  #     email => 'admin@example.com',
  #     password => 'adminpassword',
  #     ensure => $ensure,
  #     enabled => true;
  # }

  # keystone_user_role {
  #   'admin_user@admin_team':
  #     roles => ['admin','_member_'],
  #     ensure => $ensure;
  #   'admin_user@openstack':
  #     roles => ['admin','_member_'],
  #     ensure => $ensure;
  # }
}
