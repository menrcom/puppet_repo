class roles::os::designate::rabbitmq {
  include roles::os::designate::base
  $user  = hiera('designate::rabbit_userid')
  $pw    = hiera('designate::rabbit_password')
  $vhost = hiera('designate::rabbit_virtualhost')

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
