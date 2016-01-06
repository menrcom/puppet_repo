class openstack::workarounds::glance($identity_uri) {
  glance_api_config {
    'keystone_authtoken/identity_uri':
      value => $identity_uri;
  }
  glance_registry_config {
    'keystone_authtoken/identity_uri':
      value => $identity_uri;
  }
}
