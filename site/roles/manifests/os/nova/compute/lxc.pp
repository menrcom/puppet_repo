class roles::os::nova::compute::lxc inherits roles::os::nova::compute::base {
  package {
    'lxc':
      ensure => $::nova::ensure_package;
  }
  class {
    '::nova::compute::libvirt':
      libvirt_virt_type => lxc,
      migration_support => true,
      stage             => 'setup_api_servers';
  }
}
