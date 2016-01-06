class roles::os::glance::db-master inherits roles::os::mysql::master {
  include roles::os::glance::base
  class {
    'glance::db::mysql':
      dbname        => $::roles::os::glance::base::db_name,
      user          => $::roles::os::glance::base::db_user,
      host          => $::roles::os::glance::base::db_host,
      password      => $::roles::os::glance::base::db_pass,
      allowed_hosts => $::roles::os::glance::base::db_allow,
      stage         => 'create_database_schemas';
  }
}
