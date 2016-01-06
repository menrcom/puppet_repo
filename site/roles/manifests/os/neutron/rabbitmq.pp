class roles::os::neutron::rabbitmq {
  include roles::os::neutron::base
  $user  = hiera('neutron::rabbit_user')
  $pw    = hiera('neutron::rabbit_password')
  $vhost = hiera('neutron::rabbit_virtual_host')

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
