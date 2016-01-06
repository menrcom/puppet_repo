class roles::memcache inherits roles::common {
  class {
    '::memcached':
      stage => 'setup_database_servers';
  }
}
