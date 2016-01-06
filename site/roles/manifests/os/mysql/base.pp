class roles::os::mysql::base inherits roles::os::base {

  $mysql_users               = hiera("mysql_users")
  $replication_user_name     = 'user_repl'
  $replication_user          = $mysql_users[$replication_user_name]
  $replication_user_password = $replication_user['password']

  class {
    '::mysql::server':
      stage => 'setup_database_servers';
  }
}
