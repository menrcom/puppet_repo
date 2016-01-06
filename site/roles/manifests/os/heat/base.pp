class roles::os::heat::base {
  $service_name        = hiera('openstack::heat::service')
  $ks_tenant           = hiera('openstack::heat::tenant')
  $ks_user             = hiera('openstack::heat::user')
  $ks_pass             = hiera('openstack::heat::password')
  $db_name             = hiera('openstack::heat::db::name')
  $db_user             = hiera('openstack::heat::db::user')
  $db_pass             = hiera('openstack::heat::db::pass')
  $db_host             = hiera('openstack::heat::db::host')
  $db_allow            = hiera('openstack::heat::db::allow')
  $endpoint            = $::roles::os::base::endpoints['heat']
  $ks_endpoint         = $::roles::os::base::endpoints['keystone']
  $ks_internal         = $ks_endpoint['internal_url']
  $ks_admin            = $ks_endpoint['admin_url']
  $auth_uri            = "${ks_internal}/v2.0"
  $identity_uri        = $ks_admin
  $ec2auth_uri         = "${ks_internal}/v2.0/ec2tokens"
  $database_connection = "mysql://${db_user}:${db_pass}@${db_host}/${db_name}"
}
