class roles::os::neutron::db-master inherits roles::os::mysql::master {
  include roles::os::neutron::base
  class {
    '::neutron::db::mysql':
      password      => $::roles::os::neutron::base::db_pass,
      dbname        => $::roles::os::neutron::base::db_name,
      user          => $::roles::os::neutron::base::db_user,
      host          => $::roles::os::neutron::base::db_host,
      allowed_hosts => $::roles::os::neutron::base::db_allow,
      stage         => 'create_database_schemas';
  }
}
