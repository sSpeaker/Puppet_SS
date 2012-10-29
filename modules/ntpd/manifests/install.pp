class ntpd::install ( $ntpd_package_name='ntpd',
                      $ntpd_package_version='latest') {
  package {$ntpd_package_name:
    ensure => $ntpd_package_version,
  }
}