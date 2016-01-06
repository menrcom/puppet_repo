class roles::ceph::client inherits roles::ceph::base {
  # ceph::key {
  #   'client.openstack':
  #     secret  => $openstack_key,
  #     user    => $openstack_key_owner,
  #     group   => $openstack_key_group,
  #     mode    => $openstack_key_mode,
  #     cap_mon => 'allow r',
  #     cap_osd => 'allow class-read object_prefix rbd_children, allow rwx pool=rbd';
  # }
}
