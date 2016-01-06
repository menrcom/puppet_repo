class roles::os::heat::api {
  include ::roles::os::heat::base
  include ::roles::os::heat::common
  class {
    ['::heat::api',
     '::heat::api_cloudwatch',
     '::heat::api_cfn']:
      package_ensure => $::heat::package_ensure,
      stage => 'setup_api_servers';
  }

}
