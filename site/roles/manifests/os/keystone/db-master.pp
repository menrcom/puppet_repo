class roles::os::keystone::db-master inherits roles::os::mysql::master {
  include roles::os::base
  $db_name  = hiera('openstack::keystone::db::name', 'db_keystone')
  $db_user  = hiera('openstack::keystone::db::user', 'user_keystone')
  $db_pass  = hiera('openstack::keystone::db::pass')
  $db_host  = hiera('openstack::keystone::db::host')
  $db_allow = hiera('openstack::keystone::db::allow')
  class {
    'keystone::db::mysql':
      dbname        => $db_name,
      user          => $db_user,
      host          => $db_host,
      password      => $db_pass,
      allowed_hosts => $db_allow,
      stage         => 'create_database_schemas';
  }
}
