class roles::os::nova::conductor {
  include roles::os::nova::base
  include roles::os::nova::common
  class {
    '::nova::conductor':
      enabled        => true,
      ensure_package => $::nova::ensure_package,
      stage          => 'setup_api_servers';
  }
}
