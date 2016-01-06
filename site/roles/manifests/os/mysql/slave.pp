class roles::os::mysql::slave inherits roles::os::mysql::base {
  $replication_master_host   = hiera('mysql::replication_master')
  file {
    '/etc/mysql/setup_replication.sql':
      ensure => file,
      owner  => root,
      group  => root,
      mode   => '0400',
      content => "STOP SLAVE IO_THREAD, SQL_THREAD;
      CHANGE MASTER TO
      MASTER_HOST='${replication_master_host}',
      MASTER_USER='${replication_user_name}',
      MASTER_PASSWORD='${replication_user_password}',
      MASTER_AUTO_POSITION=1;
    START SLAVE IO_THREAD, SQL_THREAD;";
  }
}
