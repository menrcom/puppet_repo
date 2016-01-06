class openstack::workarounds::nova_network {
  nova_config {
    'DEFAULT/multi_host':
      value => 'True';
  }
}
