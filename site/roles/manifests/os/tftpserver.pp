class roles::os::tftpserver inherits roles::os::base {
  include ::tftp
  tftp::file {
    'pxelinux.0':
      source => 'puppet:///modules/roles/os/pxelinux.0';
    'pxelinux.cfg':
      ensure => directory;
    'pxelinux.cfg/default':
      ensure => file,
      source => 'puppet:///modules/roles/os/pxelinux.cfg.default';
    'linux':
      source => 'puppet:///modules/roles/os/linux';
    'initrd.gz':
      source => 'puppet:///modules/roles/os/initrd.gz';
  }
}
