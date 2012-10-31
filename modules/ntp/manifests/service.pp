 class ntp::service {

 service { $ntp::service_name:
    ensure     => $ntp::service_ensure_real,
    enable     => $ntp::service_enable,
    hasstatus  => $ntp::service_hasstatus,
    hasrestart => $ntp::service_hasrestart,
  }
}
