class ntp::install (
  $autoupgrade = $ntp::params::autoupgrade,
  $package = $ntp::params::package,
  $ensure = $ntp::params::package_ensure
){
  package { $package:
    ensure => $ensure,
  }
}
