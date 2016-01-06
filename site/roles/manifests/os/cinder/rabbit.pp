class roles::os::cinder::rabbit {
  include roles::os::cinder::base
  $user  = hiera('cinder::rabbit_userid')
  $pw    = hiera('cinder::rabbit_password')
  $vhost = hiera('cinder::rabbit_virtual_host')

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
