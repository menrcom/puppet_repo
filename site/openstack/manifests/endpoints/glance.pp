# Use this copypaste, unless 'kilo',
# because in 'juno' *_url parameters not supported.
class openstack::endpoints::glance(
  $ensure=present,
  $region,
  $service_name,
  $public_url,
  $admin_url,
  $internal_url
) {
  keystone_endpoint {
    "${region}/${service_name}":
      ensure       => $ensure,
      public_url   => $public_url,
      admin_url    => $admin_url,
      internal_url => $internal_url
  }
}
