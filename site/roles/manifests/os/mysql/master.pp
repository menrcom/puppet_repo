class roles::os::mysql::master inherits roles::os::mysql::base {
  database_user {
    $replication_user_name:
      password_hash => mysql_password_hash($mysql_users[$replication_user_name]);
      # require  => Class['mysql::server'];
  }
  database_grant {
    "${replication_user_name}@%/%":
      privileges => ['replication_priv'];
      # require  => Class['mysql::server'];
  }
}
