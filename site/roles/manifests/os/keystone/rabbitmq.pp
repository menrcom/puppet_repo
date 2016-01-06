class roles::os::keystone::rabbitmq inherits roles::os::rabbitmq {
  include roles::os::base
  $user  = hiera('keystone::rabbit_userid')
  $pw    = hiera('keystone::rabbit_password')
  $vhost = hiera('keystone::rabbit_virtual_host')

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
