class roles::puppetmaster inherits roles::common {

  define remove_packages($prefix) {
    package { "${prefix}${title}": ensure => purged }
  }
  
  remove_packages { ['apache','apt','concat','firewall','inifile','mysql','ntp','postgresql','stdlib','xinetd']:
    prefix => "puppet-module-puppetlabs-"
  }

  package { ['puppetmaster-passenger','puppet','puppetlabs-release', 'git']:
    ensure => installed,
    require => File['/etc/puppet/puppet.conf','/etc/puppet/hiera.yaml']
  }

  package { ['r10k']:
    ensure => latest,
    provider => gem
  }

  file { ["/etc/puppetlabs", "/etc/puppetlabs/r10k"]:
    ensure => directory,
    mode   => "0755",
    owner  => "root",
    group  => "root";
  "/etc/puppetlabs/r10k/r10k.yaml":
    ensure => file,
    mode   => "0644",
    owner  => "root",
    group  => "root",
    source => "puppet:///modules/roles/puppetmaster/r10k.yaml";
  "/etc/hiera.yaml":
    ensure => file,
    mode   => "0644",
    owner  => "root",
    group  => "root",
    source => "puppet:///modules/roles/puppetmaster/hiera.yaml";
  "/etc/puppet/hiera.yaml":
    ensure => link,
    target => '/etc/hiera.yaml';
  }
  
}
