class roles::os::heat::db-master inherits roles::os::mysql::master {
  include roles::os::heat::base
  class {
    '::heat::db::mysql':
      password      => $::roles::os::heat::base::db_pass,
      dbname        => $::roles::os::heat::base::db_name,
      user          => $::roles::os::heat::base::db_user,
      host          => $::roles::os::heat::base::db_host,
      allowed_hosts => $::roles::os::heat::base::db_allow,
      stage         => 'create_database_schemas';
  }
}
