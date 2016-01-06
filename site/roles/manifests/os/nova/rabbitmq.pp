class roles::os::nova::rabbitmq {
  include roles::os::nova::base
  $user  = hiera('nova::rabbit_userid')
  $pw    = hiera('nova::rabbit_password')
  $vhost = hiera('nova::rabbit_virtual_host')

  rabbitmq_user { $user:
    admin    => false,
    password => $pw,
    require  => Class['::rabbitmq'];
  }
  rabbitmq_vhost { $vhost:
    ensure => present,
    require  => Class['::rabbitmq'];
  }
  rabbitmq_user_permissions { "${user}@${vhost}":
    configure_permission => '.*',
    read_permission      => '.*',
    write_permission     => '.*',
    require  => Class['::rabbitmq'];
  }
}
