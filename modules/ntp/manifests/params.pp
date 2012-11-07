class ntp::params {
  # Common
  $package = 'ntp'
  $config_file = '/etc/ntp.conf'
  $server_list = [
   '0.pool.ntp.org',
   '1.pool.ntp.org',
   '2.pool.ntp.org',
   '3.pool.ntp.org',
  ]

   case $::osfamily {
    'Debian': {
      $service_name = 'ntp'
      $driftfile = '/var/lib/ntp/ntp.drift'
      $config_file_owner = 'root'
      $config_file_group = 'root'
      $config_file_mode  = '0644'
    }
    'RedHat': {
      $service_name = 'ntpd'
      $driftfile = '/var/lib/ntp/drift'
      $config_file_owner = 'root'
      $config_file_group = 'root'
      $config_file_mode  = '0644'
    }
    'Suse': {
      $service_name = 'ntp'
      $driftfile = '/var/lib/ntp/drift/ntp.drift'
      $config_file_owner = 'root'
      $config_file_group = 'ntp'
      $config_file_mode  = '0640'
    }
    default: {
      fail("Unsupported platform: ${::osfamily}")
    }
  }
  
  
  
  #>>>>CONFIG.PP
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
  #<<<<
  $ensure = 'present',
  #>>>>INSTAL.PP
  $autoupgrade = false,
  $package = $ntp::params::package,
  $config_file_replace = true,
  #<<<<
  #>>>>SERVICE.PP
  $service_ensure = 'running',
  $service_name = $ntp::params::service_name,
  $service_enable = true,
  $service_hasstatus = true,
  $service_hasrestart = true
  #<<<<
}
