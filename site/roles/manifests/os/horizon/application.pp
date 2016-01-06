class roles::os::horizon::application {
  include roles::os::base
  $endpoints    = hiera('openstack::endpoints')
  $ks_endpoint  = $endpoints['keystone']
  class {
    'horizon':
      keystone_url => "${ks_endpoint['public_url']}/v2.0"
  }

}
