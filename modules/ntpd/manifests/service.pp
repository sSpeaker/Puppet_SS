class ntpd::service ( $ntpd_service_name='ntpd',
                      $ntpd_service_state='running' ) {
  service { $ntpd_service_name:
    ensure => $ntpd_service_state,
  }
}