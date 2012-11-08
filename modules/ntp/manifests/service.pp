class ntp::service (
  $service_ensure     = $ntp::params::service_ensure,
  $service_name       = $ntp::params::service_name,
  $service_enable     = $ntp::params::service_enable,
  $service_hasstatus  = $ntp::params::service_hasstatus,
  $service_hasrestart = $ntp::params::service_hasrestart
 ) inherits ntp::params {

  service { $service_name:
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasstatus  => $service_hasstatus,
    hasrestart => $service_hasrestart,
  }
}
