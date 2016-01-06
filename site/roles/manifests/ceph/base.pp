class roles::ceph::base inherits roles::base {
  $mon_key             = hiera('ceph::keys::mon_key', undef)
  $admin_key           = hiera('ceph::keys::admin_key', undef)
  $osd_key             = hiera('ceph::keys::osd_key', undef)
  $openstack_key       = hiera('ceph::keys::openstack_key', undef)
  $openstack_key_owner = hiera('ceph::keys::openstack_key::owner', 'root')
  $openstack_key_group = hiera('ceph::keys::openstack_key::group', 'root')
  $openstack_key_mode  = hiera('ceph::keys::openstack_key::mode',  '0640')
  include ::ceph::repo
  include ::ceph
  Apt::Source <| tag=="ceph::repo" |> {
    pin => 750
  }
}
