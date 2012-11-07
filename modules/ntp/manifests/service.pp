 class ntp::service (
  $service_ensure = $ntp::params::service_ensure,
  $service_name = $ntp::params::service_name,
  $service_enable = $ntp::params::service_enable,
  $service_hasstatus = $ntp::params::service_hasstatus,
  $service_hasrestart = $ntp::params::service_hasrestart,
 ){
  service { $ntp::service_name:
    ensure     => $ntp::service_ensure_real,
    enable     => $ntp::service_enable,
    hasstatus  => $ntp::service_hasstatus,
    hasrestart => $ntp::service_hasrestart,
  }
}
