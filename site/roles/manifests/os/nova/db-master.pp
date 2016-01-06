class roles::os::nova::db-master inherits roles::os::mysql::master {
  include roles::os::nova::base
  class {
    '::nova::db::mysql':
      password      => $::roles::os::nova::base::db_pass,
      dbname        => $::roles::os::nova::base::db_name,
      user          => $::roles::os::nova::base::db_user,
      host          => $::roles::os::nova::base::db_host,
      allowed_hosts => $::roles::os::nova::base::db_allow,
      stage         => 'create_database_schemas';
  }
}
