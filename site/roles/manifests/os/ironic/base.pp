class roles::os::ironic::base inherits roles::os::base {
  $service_name        = hiera('openstack::ironic::service')
  $ks_tenant           = hiera('openstack::ironic::tenant')
  $ks_user             = hiera('openstack::ironic::user')
  $ks_pass             = hiera('openstack::ironic::password')
  $nw_service_name     = hiera('openstack::neutron::service')
  $ks_nw_tenant        = hiera('openstack::neutron::tenant')
  $ks_nw_user          = hiera('openstack::neutron::user')
  $ks_nw_pass          = hiera('openstack::neutron::password')
  $db_name             = hiera('openstack::ironic::db::name')
  $db_user             = hiera('openstack::ironic::db::user')
  $db_pass             = hiera('openstack::ironic::db::pass')
  $db_host             = hiera('openstack::ironic::db::host')
  $db_allow            = hiera('openstack::ironic::db::allow')
  $endpoint            = $endpoints['ironic']
  $ks_endpoint         = $endpoints['keystone']
  $nw_endpoint         = $endpoints['neutron']
  $auth_uri            = $ks_endpoint['public_url']
  $identity_uri        = $ks_endpoint['admin_url']
  $database_connection = "mysql://${db_user}:${db_pass}@${db_host}/${db_name}"
}
