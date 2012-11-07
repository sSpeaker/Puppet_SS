class ntp::config (
  $server_list = $ntp::params::server_list,
  $server_enabled = false,
  $query_networks = [],
  $interface_ignore = [],
  $interface_listen = [],
  $enable_statistics = false,
  $statsdir = undef,
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


