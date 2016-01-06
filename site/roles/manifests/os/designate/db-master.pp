class roles::os::designate::db-master inherits roles::os::mysql::master {
  include roles::os::designate::base
  class {
    '::designate::db::mysql':
      password      => $::roles::os::designate::base::db_pass,
      dbname        => $::roles::os::designate::base::db_name,
      user          => $::roles::os::designate::base::db_user,
      host          => $::roles::os::designate::base::db_host,
      allowed_hosts => $::roles::os::designate::base::db_allow,
      stage         => 'create_database_schemas';
  }
}
