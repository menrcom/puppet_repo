class roles::ceph::osd inherits roles::ceph::base {
  ceph::osd {
    '/var/ceph-data':
      ensure => present;
  }
  # ceph::key {'client.bootstrap-osd':
  #   keyring_path => '/var/lib/ceph/bootstrap-osd/ceph.keyring',
  #   secret       => $osd_key,
  # }
}
