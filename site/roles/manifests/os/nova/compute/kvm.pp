class roles::os::nova::compute::kvm inherits roles::os::nova::compute::base {
  package {
    'qemu-kvm':
      ensure => $::nova::ensure_package;
  }
  class {
    '::nova::compute::libvirt':
      libvirt_virt_type => kvm,
      migration_support => true,
      stage             => 'setup_api_servers';
  }
}
