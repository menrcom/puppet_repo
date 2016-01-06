class roles::os::designate::api inherits roles::os::designate::base {
  include ::roles::os::designate::common
  class {
    '::designate::api':
      package_ensure => $::designate::package_ensure,
      enabled        => true,
      auth_strategy  => 'keystone',
      auth_uri       => $auth_uri,
      identity_uri   => $identity_uri,
      stage          => 'setup_api_servers';
    '::designate::db':
      database_connection => $database_connection,
      stage               => 'setup_api_servers';
    ['::designate::central','::designate::sink']:
      package_ensure => $::designate::package_ensure,
      enabled        => true,
      stage          => 'setup_api_servers';
  }

}
