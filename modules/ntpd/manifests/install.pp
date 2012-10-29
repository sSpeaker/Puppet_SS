class ntpd::install {
  package {$ntpd_package_name:
    ensure => $ntpd_package_version,
  }
}