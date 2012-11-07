class ntp::config (
  $server_list = $ntp::params::server_list,
  $server_enabled = $ntp::params::server_enabled,
  $query_networks = $ntp::params::query_networks,
  $interface_ignore = $ntp::params::interface_ignore,
  $interface_listen = $ntp::params::interface_listen,
  $enable_statistics = $ntp::params::enable_statistics,
  $statsdir = $ntp::params::statsdir,
  $config_file = $ntp::params::config_file,
  $config_file_owner = $ntp::params::config_file_owner,
  $config_file_group = $ntp::params::config_file_group,
  $config_file_mode = $ntp::params::config_file_mode,
  $driftfile = $ntp::params::driftfile,
){
  file { $ntp::config_file:
    ensure  => $ntp::ensure,
    owner   => $ntp::config_file_owner,
    group   => $ntp::config_file_group,
    mode    => $ntp::config_file_mode,
    content => template('ntp/ntp.conf.erb'),
    notify  => Class['ntp::service'],
  }
}


