class ntp::install {
  package { $ntp::package:
    ensure => $ntp::package_ensure,
  }
}
