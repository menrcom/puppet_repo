class openstack::workarounds::neutron {
  neutron_config {
    'service_providers/service_provider':
      value => "LOADBALANCER:Haproxy:neutron_lbaas.services.loadbalancer.drivers.haproxy.plugin_driver.HaproxyOnHostPluginDriver:default";
    # 'service_providers/service_provider':
    #   value => "service_provider=VPN:openswan:neutron.services.vpn.service_drivers.ipsec.IPsecVPNDriver:default";
  }
}
