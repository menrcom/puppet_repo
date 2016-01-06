class roles::os::ironic::rabbitmq {
  include roles::os::ironic::base
  $user  = hiera('ironic::rabbit_userid')
  $pw    = hiera('ironic::rabbit_password')
  $vhost = hiera('ironic::rabbit_virtual_host')

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
