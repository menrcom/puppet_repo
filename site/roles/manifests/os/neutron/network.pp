class roles::os::neutron::network {
  include roles::os::neutron::common 
  include roles::os::neutron::base
  class {
    '::neutron::plugins::ml2':
      package_ensure => $::neutron::package_ensure,
      stage          => 'setup_api_servers';
    '::neutron::agents::ml2::linuxbridge':
      package_ensure => $::neutron::package_ensure,
      stage          => 'setup_api_servers';
    '::neutron::agents::dhcp':
      package_ensure => $::neutron::package_ensure,
      stage          => 'setup_api_servers';
    '::neutron::agents::metadata':
      auth_password  => $::roles::os::neutron::base::ks_pass,
      auth_tenant    => $::roles::os::neutron::base::ks_tenant,
      auth_user      => $::roles::os::neutron::base::ks_user,
      auth_url       => "${::roles::os::neutron::base::identity_uri}/v2.0",
      auth_region    => $::roles::os::base::region,
      package_ensure => $::neutron::package_ensure,
      stage          => 'setup_api_servers';
    'neutron::agents::lbaas':
      package_ensure => $::neutron::package_ensure,
      stage          => 'setup_api_servers';
    'openstack::workarounds::neutron':
      stage          => 'setup_api_servers';
    'neutron::agents::vpnaas':
      package_ensure => $::neutron::package_ensure,
      stage          => 'setup_api_servers';
    # '::neutron::agents::l3':
    #   package_ensure => $::neutron::package_ensure,
    #   stage          => 'setup_api_servers';
  }
}
