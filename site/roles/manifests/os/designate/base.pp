class roles::os::designate::base inherits roles::os::base {
  $service_name        = hiera('openstack::designate::service')
  $ks_tenant           = hiera('openstack::designate::tenant')
  $ks_user             = hiera('openstack::designate::user')
  $ks_pass             = hiera('openstack::designate::password')
  $db_name             = hiera('openstack::designate::db::name')
  $db_user             = hiera('openstack::designate::db::user')
  $db_pass             = hiera('openstack::designate::db::pass')
  $db_host             = hiera('openstack::designate::db::host')
  $db_allow            = hiera('openstack::designate::db::allow')
  $endpoint            = $endpoints['designate']
  $ks_endpoint         = $endpoints['keystone']
  $auth_uri            = $ks_endpoint['internal_url']
  $identity_uri        = $ks_endpoint['admin_url']
  $database_connection = "mysql://${db_user}:${db_pass}@${db_host}/${db_name}"
}
