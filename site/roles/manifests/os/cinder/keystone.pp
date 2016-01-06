class roles::os::cinder::keystone {
  include roles::os::cinder::base
  $pub_url_v1 = "${::roles::os::cinder::base::endpoint['public_url']}/v1/%(tenant_id)s"
  $adm_url_v1 = "${::roles::os::cinder::base::endpoint['admin_url']}/v1/%(tenant_id)s"
  $int_url_v1 = "${::roles::os::cinder::base::endpoint['internal_url']}/v1/%(tenant_id)s"
  $pub_url_v2 = "${::roles::os::cinder::base::endpoint['public_url']}/v2/%(tenant_id)s"
  $adm_url_v2 = "${::roles::os::cinder::base::endpoint['admin_url']}/v2/%(tenant_id)s"
  $int_url_v2 = "${::roles::os::cinder::base::endpoint['internal_url']}/v2/%(tenant_id)s"
  class {
    '::cinder::keystone::auth':
      tenant          => $::roles::os::cinder::base::ks_tenant,
      auth_name       => $::roles::os::cinder::base::ks_user,
      auth_name_v2    => $::roles::os::cinder::base::ks_user,
      password        => $::roles::os::cinder::base::ks_pass,
      service_name    => $::roles::os::cinder::base::service_name,
      service_name_v2 => "${::roles::os::cinder::base::service_name}v2",
      public_url      => $pub_url_v1,
      admin_url       => $adm_url_v1,
      internal_url    => $int_url_v1,
      public_url_v2   => $pub_url_v2,
      admin_url_v2    => $adm_url_v2,
      internal_url_v2 => $int_url_v2,
      region          => $::roles::os::base::region,
      stage => 'setup_api_servers';
  }
}
