class roles::os::glance::base inherits roles::os::base {
  $service_name        = hiera('openstack::glance::service')
  $ks_tenant           = hiera('openstack::glance::tenant')
  $ks_user             = hiera('openstack::glance::user')
  $ks_pass             = hiera('openstack::glance::password')
  $db_name             = hiera('openstack::glance::db::name')
  $db_user             = hiera('openstack::glance::db::user')
  $db_pass             = hiera('openstack::glance::db::pass')
  $db_host             = hiera('openstack::glance::db::host')
  $db_allow            = hiera('openstack::glance::db::allow')
  $endpoint            = $::roles::os::base::endpoints['glance']
  $ks_endpoint         = $::roles::os::base::endpoints['keystone']
  $auth_uri            = $ks_endpoint['internal_url']
  $identity_uri        = $ks_endpoint['admin_url']
  $database_connection = "mysql://${db_user}:${db_pass}@${db_host}/${db_name}"
  $validation_options  = {
    'glance-api' => {
      'command' => "glance --os-auth-url ${auth_uri} --os-tenant-name ${ks_tenant} --os-username ${ks_user} --os-password \"${ks_pass}\" image-list"
    }
  }
}
