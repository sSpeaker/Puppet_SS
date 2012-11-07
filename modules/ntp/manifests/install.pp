class ntp::install (
  $autoupgrade = $ntp::params::autoupgrade,
  $package = $ntp::params::package,
  $config_file_replace = $ntp::params::config_file_replace,
){
  package { $ntp::package:
    ensure => $ntp::package_ensure,
  }
}
