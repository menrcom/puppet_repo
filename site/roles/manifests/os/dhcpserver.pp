class roles::os::dhcpserver inherits roles::os::base {
  include dhcp
  dhcp::pool {
    'management_network':
      network => '10.13.252.0',
      mask    => '255.255.255.0',
      range   => ['10.13.252.150','10.13.252.200'],
      gateway => '10.13.252.201'
  }
  dhcp::host {
    'volume1':
      mac => '00:25:90:86:7b:65',
      ip  => '10.13.252.200';
    'volume2':
      mac => '0c:c4:7a:6b:16:09',
      ip  => '10.13.252.199';
    'volume3':
      mac => '0c:c4:7a:6a:1d:a1',
      ip  => '10.13.252.198';
  }
}
