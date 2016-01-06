class roles::os::cinder::db-master inherits roles::os::mysql::master {
  include roles::os::cinder::base
  class {
    '::cinder::db::mysql':
      password      => $::roles::os::cinder::base::db_pass,
      dbname        => $::roles::os::cinder::base::db_name,
      user          => $::roles::os::cinder::base::db_user,
      host          => $::roles::os::cinder::base::db_host,
      allowed_hosts => $::roles::os::cinder::base::db_allow,
      stage => 'create_database_schemas';
  }
}
