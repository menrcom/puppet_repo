# Use this copypaste, unless 'kilo',
# because in 'juno' *_url parameters not supported.
class openstack::endpoints::nova(
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
      public_url   => "${public_url}/v2/%(tenant_id)s",
      admin_url    => "${admin_url}/v2/%(tenant_id)s",
      internal_url => "${internal_url}/v2/%(tenant_id)s"
  }
}
