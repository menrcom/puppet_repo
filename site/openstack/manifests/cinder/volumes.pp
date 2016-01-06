class openstack::cinder::volumes(
  $iscsi_ip_address = hiera('cinder::volume::iscsi::iscsi_ip_address'),
  $volume_driver    = hiera('cinder::volume::iscsi::volume_driver','cinder.volume.drivers.lvm.LVMVolumeDriver'),
  $volume_group     = hiera('cinder::volume::iscsi::volume_group','cinder-volumes'),
  $volumes_dir      = hiera('cinder::volume::iscsi::volumes_dir','/var/lib/cinder/volumes'),
  $iscsi_helper     = hiera('cinder::volume::iscsi::iscsi_helper',$::cinder::params::iscsi_helper),
  $iscsi_protocol   = hiera('cinder::volume::iscsi::iscsi_protocol','iscsi'),
  $rbd_pool                         = hiera('cinder::volume::rbd::rbd_pool', 'cinder-volumes'),
  $rbd_user                         = hiera('cinder::volume::rbd::rbd_user', 'openstack'),
  $rbd_ceph_conf                    = hiera('cinder::volume::rbd::rbd_ceph_conf','/etc/ceph/ceph.conf'),
  $rbd_flatten_volume_from_snapshot = hiera('cinder::volume::rbd::rbd_flatten_volume_from_snapshot',false),
  $rbd_secret_uuid                  = hiera('cinder::volume::rbd::rbd_secret_uuid',false),
  $volume_tmp_dir                   = hiera('cinder::volume::rbd::volume_tmp_dir',false),
  $rbd_max_clone_depth              = hiera('cinder::volume::rbd::rbd_max_clone_depth','5'),
) {
  cinder::backend::rbd { 'CEPH1':
    rbd_pool                         => $rbd_pool,
    rbd_user                         => $rbd_user,
    rbd_ceph_conf                    => $rbd_ceph_conf,
    rbd_flatten_volume_from_snapshot => $rbd_flatten_volume_from_snapshot,
    rbd_secret_uuid                  => $rbd_secret_uuid,
    volume_tmp_dir                   => $volume_tmp_dir,
    rbd_max_clone_depth              => $rbd_max_clone_depth,
    extra_options                    => hiera('cinder::volume::iscsi::extra_options',{}),
  }

  cinder::backend::iscsi { 'LVM1':
    iscsi_ip_address => $iscsi_ip_address,
    volume_driver    => $volume_driver,
    volume_group     => $volume_group,
    volumes_dir      => $volumes_dir,
    iscsi_helper     => $iscsi_helper,
    iscsi_protocol   => $iscsi_protocol,
    extra_options    => hiera('cinder::volume::rbd::extra_options',{}),
  }

  cinder_config {
    'DEFAULT/auth_strategy':
      value => 'keystone';
  }
}
