class roles::os::designate::common {
  class {
    '::designate':
      stage => 'setup_api_servers';
  }
}
