class ntp (
  $server_list = bdsm('g_ntp_server_list','ntp.ubuntu.com'),
  $server_enabled = bdsm('g_ntp_server_enabled',true),
  $query_networks = bdsm('g_ntp_query_networks',''),
  $interface_ignore = bdsm('g_ntp_interface_ignore',''),
  $interface_listen = bdsm('g_ntp_interface_listen',''),
  $enable_statistics = bdsm('g_ntp_enable_statistics',true),
  $statsdir = bdsm('g_ntp_statsdir',undef),
  $config_file = bdsm('g_ntp_config_file','/etc/ntp.conf'),
  $config_file_owner = bdsm('g_ntp_config_file_owner','root'),
  $config_file_group = bdsm('g_ntp_config_file_group','root'),
  $config_file_mode = bdsm('g_ntp_config_file_mode','0644'),
  $driftfile = $::osfamily ? {
                 'Debian' => bdsm('g_ntp_driftfile','/var/lib/ntp/ntp.drift'),
                 'RedHat' => bdsm('g_ntp_driftfile','/var/lib/ntp/drift'),
               },
  $ensure = bdsm('g_ntp_ensure','present'),
  $autoupgrade = bdsm('g_ntp_autoupgrade',true),
  $package = bdsm('g_ntp_package','ntp'),
  $service_ensure = bdsm('g_ntp_service_ensure','running'),
  $service_name = $::osfamily ? {
                    'Debian' => bdsm('g_ntp_service_name','ntp'),
                    'RedHat' => bdsm('g_ntp_service_name','ntpd'),
                  },
  $service_enable = bdsm('g_ntp_service_enable',true),
  $use_install = bdsm('g_ntp_server_list',true),
  $use_config = bdsm('g_ntp_server_list',true),
  $use_service = bdsm('g_ntp_server_list',true),
) {

  case $ensure {
    /(present)/: {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }

      if $server_enabled == false {
        $interface_ignore_real = [ 'all', ]
        $interface_listen_real = [ 'lo', ]
      } elsif $server_enabled == true {
        $interface_ignore_real = $interface_ignore
        $interface_listen_real = $interface_listen
      } else {
        fail('server_enabled parameter must be true or false')
      }

      if $enable_statistics == true {
        if ! $statsdir {
          fail('statsdir parameter must be set, if enable_statistics is true')
        }
      }
    }
    /(absent)/: {
      $package_ensure = 'absent'
      $service_ensure = 'stopped'
    }
    default: {
      fail('ensure parameter must be present or absent')
    }
  }

	include ntp::install
	include ntp::config
	include ntp::service
  Class ['ntp::install']-> Class['ntp::service'] -> Class['ntp::config']


}
