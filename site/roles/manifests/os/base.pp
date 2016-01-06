class roles::os::base inherits roles::base {
  stage { 'setup':  before => Stage['main'] }
  stage { 'runtime': require => Stage['main'] }
  -> stage { 'setup_database_servers': }
  -> stage { 'create_database_schemas': }
  -> stage { 'setup_keystone_api': }
  -> stage { 'deploy_keystone_data': }
  -> stage { 'setup_api_servers': }
  -> stage { 'deploy_api_data': }
  -> stage { 'deploy': }
  $region    = hiera('openstack::region')
  $endpoints = hiera('openstack::endpoints')
  class { ['::openstack::keyring']:
    stage => setup;
  }

  apt::source {
    'cloudarchive':
      location => 'http://ubuntu-cloud.archive.canonical.com/ubuntu',
      release  => 'trusty-updates/kilo',
      repos    => 'main',
      pin      => '700';
    'percona':
      location => 'http://repo.percona.com/apt',
      release  => "${::lsbdistcodename}",
      repos    => 'main',
      pin      => '700',
      key      => 'CD2EFD2A';
  }

  package {
    ['bridge-utils','vlan','virt-what']: ensure => installed;
  }

}
