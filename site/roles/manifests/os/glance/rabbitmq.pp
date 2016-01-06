class roles::os::glance::rabbitmq {
  include roles::os::glance::base
  $user  = hiera('glance::rabbit_userid')
  $pw    = hiera('glance::rabbit_password')
  $vhost = hiera('glance::rabbit_virtual_host')

  rabbitmq_user { $user:
    admin    => false,
    password => $pw,
    require  => Class['::rabbitmq'];
  }
  # rabbitmq_vhost { $vhost:
  #   ensure => present,
  #   require  => Class['::rabbitmq'];
  # }
  rabbitmq_user_permissions { "${user}@${vhost}":
    configure_permission => '.*',
    read_permission      => '.*',
    write_permission     => '.*',
    require  => Class['::rabbitmq'];
  }
}
