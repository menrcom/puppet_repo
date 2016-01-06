class roles::os::rabbitmq inherits roles::os::base {
  class {
    '::rabbitmq':
      config_cluster    => false,
      service_manage    => true,
      delete_guest_user => false;
      # stage             => 'main';
  }
}
