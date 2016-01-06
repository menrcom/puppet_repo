class roles::os::nova::base inherits roles::os::base {
  $service_name        = hiera('openstack::nova::service')
  $ks_tenant           = hiera('openstack::nova::tenant')
  $ks_user             = hiera('openstack::nova::user')
  $ks_pass             = hiera('openstack::nova::password')
  $nw_service_name     = hiera('openstack::neutron::service')
  $ks_nw_tenant        = hiera('openstack::neutron::tenant')
  $ks_nw_user          = hiera('openstack::neutron::user')
  $ks_nw_pass          = hiera('openstack::neutron::password')
  $db_name             = hiera('openstack::nova::db::name')
  $db_user             = hiera('openstack::nova::db::user')
  $db_pass             = hiera('openstack::nova::db::pass')
  $db_host             = hiera('openstack::nova::db::host')
  $db_allow            = hiera('openstack::nova::db::allow')
  $endpoint            = $::roles::os::base::endpoints['nova']
  $ks_endpoint         = $::roles::os::base::endpoints['keystone']
  $nw_endpoint         = $::roles::os::base::endpoints['neutron']
  $auth_uri            = $ks_endpoint['internal_url']
  $identity_uri        = $ks_endpoint['admin_url']
  $database_connection = "mysql://${db_user}:${db_pass}@${db_host}/${db_name}"
  $live_migration_flag = hiera('openstack::nova::live_migration_flag')
  $block_migration_flag= hiera('openstack::nova::block_migration_flag')
  $images_type         = hiera('openstack::nova::images_type')
  $images_volume_group = hiera('openstack::nova::images_volume_group')
}
