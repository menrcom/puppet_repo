class roles::os::neutron::common {
  class {
    '::neutron':
      stage               => 'setup_api_servers';
    '::neutron::quota':
      stage               => 'setup_api_servers';
  }
}
