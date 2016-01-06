class openstack::workarounds::glance_api {
  glance_api_config {
    'image_format/container_formats':
      value => 'ami,ari,aki,bare,ovf,ova';
    'image_format/disk_formats':
      value => 'ami,ari,aki,vhd,vmdk,raw,qcow2,vdi,iso';
  }
}
