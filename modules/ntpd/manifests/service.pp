class ntpd::service {
  service { $ntpd_service_name:
    ensure => $ntpd_service_state,
  }
}