class roles::os::neutron::compute {
  include roles::os::neutron::common 
  include roles::os::neutron::base
  class {
    '::neutron::plugins::ml2':
      package_ensure => $::neutron::package_ensure,
      stage          => 'setup_api_servers';
    '::neutron::agents::ml2::linuxbridge':
      package_ensure => $::neutron::package_ensure,
      stage          => 'setup_api_servers';
  }
}
