class openstack::workarounds::nova_compute($live_migration_flag, $block_migration_flag, $images_type, $images_volume_group) {
  nova_config {
    # 'libvirt/live_migration_flag':  value => $live_magration_flag;
    # 'libvirt/block_migration_flag': value => $block_magration_flag;
    'libvirt/live_migration_flag':  value => 'VIR_MIGRATE_UNDEFINE_SOURCE,VIR_MIGRATE_PEER2PEER,VIR_MIGRATE_LIVE';
    'libvirt/block_migration_flag': value => 'VIR_MIGRATE_UNDEFINE_SOURCE,VIR_MIGRATE_PEER2PEER,VIR_MIGRATE_LIVE,VIR_MIGRATE_NON_SHARED_INC';
    'libvirt/images_type':          value => $images_type;
    'libvirt/images_volume_group':  value => $images_volume_group;
  }
}
