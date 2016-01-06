class roles::os::nameserver inherits roles::os::base {
  $zones = hiera_hash('openstack::nameserver::zones')
  include bind
  bind::server::conf {
    '/etc/bind/named.conf':
      directory         => '/var/lib/bind',
      dump_file         => undef,
      statistics_file   => undef,
      memstatistics_file=> undef,
      listen_on_addr    => hiera_array('openstack::nameserver::listen'),
      allow_query       => hiera_array('openstack::nameserver::allow_query'),
      allow_recursion   => hiera_array('openstack::nameserver::allow_query'),
      zones             => $zones,
      dnssec_enable     => false,
      dnssec_validation => false,
      includes          => ['/etc/bind/named.conf.default-zones'],
      require           => Class['bind'];
  }
  $zone_names = keys($zones)
  bind::server::file {
    $zone_names:
      source_base => "puppet:///modules/roles/os/zones/",
      owner       => root,
      group       => bind,
      mode        => 0644,
      dirmode     => 0755,
      zonedir     => '/var/lib/bind',
      ensure      => present,
      require     => File['/etc/bind/named.conf'];
  }
}
