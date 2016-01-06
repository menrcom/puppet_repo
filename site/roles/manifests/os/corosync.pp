class roles::os::corosync inherits roles::os::base {
  include ::corosync
  # cs_property {
  #   'stonith-enabled':
  #     value   => 'false';
  #   'no-quorum-policy' :
  #     value   => 'ignore';
  # }
}
