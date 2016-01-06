class roles::common {
#  include stdlib
  file {
    "/etc/puppet/puppet.conf":
      ensure => file,
      mode   => "0644",
      owner  => "root",
      group  => "root",
      source => "puppet:///modules/roles/puppetmaster/puppet.conf";
  }
  include ntp
  package {['vim-nox', 'screen', 'strace', 'ltrace',
            'emacs24-nox', 'emacs24-el', 'puppet-el', 'yaml-mode']:
    ensure => latest;
  }
}
