class openstack::keyring {
  package { ['ubuntu-cloud-keyring']: ensure => latest, notify => Exec['apt_update']; }
}
