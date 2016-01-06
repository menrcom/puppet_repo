class roles::os::nova::scheduler {
  include roles::os::nova::base
  include roles::os::nova::common
  class {
    '::nova::scheduler':
      enabled => true,
      ensure_package => $::nova::ensure_package,
      stage => 'setup_api_servers';
  }
}
