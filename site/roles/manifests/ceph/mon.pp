class roles::ceph::mon inherits roles::ceph::base {
  ceph::mon { $::hostname:
    authentication_type => 'none',
    key                 => $mon_key;
  }
  # Ceph::Key {
  #   inject         => true,
  #   inject_as_id   => 'mon.',
  #   inject_keyring => "/var/lib/ceph/mon/ceph-${::hostname}/keyring",
  # }
  # ceph::key {
  #   'client.admin':
  #     secret  => $admin_key,
  #     cap_mon => 'allow *',
  #     cap_osd => 'allow *',
  #     cap_mds => 'allow';
  #   'client.bootstrap-osd':
  #     secret  => $osd_key,
  #     cap_mon => 'allow profile bootstrap-osd';
  # }
}
