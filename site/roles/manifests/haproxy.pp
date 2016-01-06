class roles::haproxy inherits roles::common {
  class { '::haproxy': }
  haproxy::listen { "mysql_front0":
    collect_exported => false,
    ipaddress => $::ipaddress,
    ports     => "3306",
    mode      => "tcp"
  }
  haproxy::balancermember { "mysql0":
    listening_service => "mysql_front0",
    server_names      => ["ubuntu01"],
    ipaddresses       => ["192.168.122.181"],
    ports             => "3306",
    options           => "check"
  }
  haproxy::balancermember { "mysql1":
    listening_service => "mysql_front0",
    server_names      => ["ubuntu02"],
    ipaddresses       => ["192.168.122.144"],
    ports             => "3306",
    options           => "check"
  }
}
