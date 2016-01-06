class roles::os::ironic::common {
  class {
    '::ironic':
      database_connection => $::roles::os::ironic::base::database_connection,
      stage               => 'setup_api_servers';
    '::ironic::drivers::pxe':
      stage               => 'setup_api_servers';
  }
}
