class roles::os::heat::engine {
  include ::roles::os::heat::base
  include ::roles::os::heat::common
  $md_url = $::roles::os::heat::base::endpoint['metadata_url']
  $wc_url = $::roles::os::heat::base::endpoint['waitcondition_url']
  $ws_url = $::roles::os::heat::base::endpoint['watch_url']
  class {
    '::heat::engine':
      package_ensure => $::heat::package_ensure,
      heat_metadata_server_url => $md_url,
      heat_waitcondition_server_url => $wc_url,
      heat_watch_server_url => $ws_url,
      stage => 'setup_api_servers';
  }
}
