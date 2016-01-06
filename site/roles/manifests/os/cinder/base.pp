class roles::os::cinder::base inherits roles::os::base {
  $service_name        = hiera('openstack::cinder::service')
  $ks_tenant           = hiera('openstack::cinder::tenant')
  $ks_user             = hiera('openstack::cinder::user')
  $ks_pass             = hiera('openstack::cinder::password')
  $db_name             = hiera('openstack::cinder::db::name')
  $db_user             = hiera('openstack::cinder::db::user')
  $db_pass             = hiera('openstack::cinder::db::pass')
  $db_host             = hiera('openstack::cinder::db::host')
  $db_allow            = hiera('openstack::cinder::db::allow')
  $endpoint            = $endpoints['cinder']
  $ks_endpoint         = $endpoints['keystone']
  $auth_uri            = $ks_endpoint['internal_url']
  $identity_uri        = $ks_endpoint['admin_url']
  $database_connection = "mysql://${db_user}:${db_pass}@${db_host}/${db_name}"
}
