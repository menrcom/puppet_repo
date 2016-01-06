class roles::mysql::master inherits roles::common {
  class {
    '::mysql::server':
      stage => 'setup_database_servers';
  }
}
