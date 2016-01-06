class roles::os::nova::compute::base {
  include roles::os::nova::base
  include roles::os::nova::common
  package {
    ['libguestfs-tools']:
      ensure => latest;
    ['nova-api-metadata']:
      ensure => absent;
  }
  class {
    '::nova::compute':
      enabled           => true,
      ensure_package    => $::nova::ensure_package,
      stage             => 'setup_api_servers';
    '::openstack::workarounds::nova_compute':
      live_migration_flag  => $::roles::os::nova::base::live_migration_flag,
      block_migration_flag => $::roles::os::nova::base::block_migration_flag,
      images_type          => $::roles::os::nova::base::images_type,
      images_volume_group  => $::roles::os::nova::base::images_volume_group,
      stage             => 'setup_api_servers';
    '::nova::compute::neutron':
      stage             => 'setup_api_servers';
    '::nova::compute::rbd':
      stage             => 'setup_api_servers';
  }

  @@sshkey { $::hostname:
    ensure => present,
    type   => rsa,
    key    => $::sshrsakey;
  }

  Sshkey <<| |>>

}
