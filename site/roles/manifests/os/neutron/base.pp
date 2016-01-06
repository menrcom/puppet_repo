class roles::os::neutron::base inherits roles::os::base {
  $service_name        = hiera('openstack::neutron::service')
  $ks_tenant           = hiera('openstack::neutron::tenant')
  $ks_user             = hiera('openstack::neutron::user')
  $ks_pass             = hiera('openstack::neutron::password')
  $nv_service_name     = hiera('openstack::nova::service')
  $ks_nv_tenant        = hiera('openstack::nova::tenant')
  $ks_nv_user          = hiera('openstack::nova::user')
  $ks_nv_pass          = hiera('openstack::nova::password')
  $db_name             = hiera('openstack::neutron::db::name')
  $db_user             = hiera('openstack::neutron::db::user')
  $db_pass             = hiera('openstack::neutron::db::pass')
  $db_host             = hiera('openstack::neutron::db::host')
  $db_allow            = hiera('openstack::neutron::db::allow')
  $endpoint            = $::roles::os::base::endpoints['neutron']
  $ks_endpoint         = $::roles::os::base::endpoints['keystone']
  $nv_endpoint         = $::roles::os::base::endpoints['nova']
  $auth_uri            = $ks_endpoint['internal_url']
  $identity_uri        = $ks_endpoint['admin_url']
  $database_connection = "mysql://${db_user}:${db_pass}@${db_host}/${db_name}"
}
