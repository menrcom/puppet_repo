class roles::os::nova::corosync {
  include ::roles::os::nova::base
  include ::roles::os::corosync
  cs_primitive {
    'master_ip_management':
      primitive_class => 'ocf',
      primitive_type  => 'IPaddr2',
      provided_by     => 'heartbeat',
      parameters      => { 'ip' => '10.13.252.252', 'cidr_netmask' => '24', 'nic' => 'br-management' },
      operations      => { 'monitor' => { 'interval' => '10s' } },
      require         => Class['::corosync'];
    'slave_ip_management':
      primitive_class => 'ocf',
      primitive_type  => 'IPaddr2',
      provided_by     => 'heartbeat',
      parameters      => { 'ip' => '10.13.252.251', 'cidr_netmask' => '24', 'nic' => 'br-management' },
      operations      => { 'monitor' => { 'interval' => '10s' } },
      require         => Class['::corosync'];
    'master_ip_platform':
      primitive_class => 'ocf',
      primitive_type  => 'IPaddr2',
      provided_by     => 'heartbeat',
      parameters      => { 'ip' => '10.13.253.252', 'cidr_netmask' => '24', 'nic' => 'br-platform' },
      operations      => { 'monitor' => { 'interval' => '10s' } },
      require         => Class['::corosync'];
    'slave_ip_platform':
      primitive_class => 'ocf',
      primitive_type  => 'IPaddr2',
      provided_by     => 'heartbeat',
      parameters      => { 'ip' => '10.13.253.251', 'cidr_netmask' => '24', 'nic' => 'br-platform' },
      operations      => { 'monitor' => { 'interval' => '10s' } },
      require         => Class['::corosync'];
  }
  cs_location {
    'master_ip_management':
      primitive => 'master_ip_management',
      node_name => 'api1',
      score     => 'INFINITY';
    'master_ip_platform':
      primitive => 'master_ip_platform',
      node_name => 'api1',
      score     => 'INFINITY';
    'slave_ip_management':
      primitive => 'slave_ip_management',
      node_name => 'api2',
      score     => 'INFINITY';
    'slave_ip_platform':
      primitive => 'slave_ip_platform',
      node_name => 'api2',
      score     => 'INFINITY';
  }
}
