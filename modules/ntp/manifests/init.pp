class ntp( $var = "1", ) {
  notify {"HHHHHHH":}
}


#class ntp (
#  $server_list = hiera('g_ntp_server_list','ntp.ubuntu.com'),
#  $server_enabled = hiera('g_ntp_server_enabled',true),
#  $query_networks = hiera('g_ntp_query_networks',''),
#  $interface_ignore = hiera('g_ntp_interface_ignore',''),
#  $interface_listen = hiera('g_ntp_interface_listen',''),
#  $enable_statistics = hiera('g_ntp_enable_statistics',true),
#  $statsdir = hiera('g_ntp_statsdir',undef),
#  $config_file = hiera('g_ntp_config_file','/etc/ntp.conf'),
#  $config_file_owner = hiera('g_ntp_config_file_owner','root'),
#  $config_file_group = hiera('g_ntp_config_file_group','root'),
#  $config_file_mode = hiera('g_ntp_config_file_mode','0644'),
#  $driftfile = undef,
#  $ensure = hiera('g_ntp_ensure','present'),
#  $autoupgrade = hiera('g_ntp_autoupgrade',true),
#  $package = hiera('g_ntp_package','ntp'),
#  $service_ensure = hiera('g_ntp_service_ensure','running'),
#  $service_name = undef,
#  $service_enable = hiera('g_ntp_service_enable',true),
#  $use_install = hiera('g_ntp_server_list',true),
#  $use_config = hiera('g_ntp_server_list',true),
#  $use_service = hiera('g_ntp_server_list',true),
#) {
/*
  if ! $service_name {
    $service_name = $::osfamily ? {
                        'Debian' => hiera('g_ntp_service_name','ntp'),
                        'RedHat' => hiera('g_ntp_service_name','ntpd'),
                        default  => hiera('g_ntp_service_name',undef),
                    }
  }

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
        if ! $driftfile {
          $driftfile = $::osfamily ? {
                         'Debian' => hiera('g_ntp_driftfile','/var/lib/ntp/ntp.drift'),
                         'RedHat' => hiera('g_ntp_driftfile','/var/lib/ntp/drift'),
                         default  => hiera('g_ntp_driftfile',undef),
                       }
          if ! $statsdir {
            fail('statsdir parameter must be set, if enable_statistics is true')
          }
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
 
  Class['ntp::install']-> Class['ntp::service'] -> Class['ntp::config']
  include ntp::install
  include ntp::config
  include ntp::service
*/
#}