class roles::os::ironic::db-master inherits roles::os::mysql::master {
  include roles::os::ironic::base
  class {
    '::ironic::db::mysql':
      password      => $::roles::os::ironic::base::db_pass,
      dbname        => $::roles::os::ironic::base::db_name,
      user          => $::roles::os::ironic::base::db_user,
      host          => $::roles::os::ironic::base::db_host,
      allowed_hosts => $::roles::os::ironic::base::db_allow,
      stage         => 'create_database_schemas';
  }
}
