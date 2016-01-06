class openstack::workarounds::nova($identity_uri, $memcached_servers) {
  nova_config {
    'keystone_authtoken/identity_uri':
      value => $identity_uri;
    'keystone_authtoken/memcached_servers':
      value => $memcached_servers;
    'DEFAULT/multi_host':
      value => 'True';
  }
}
