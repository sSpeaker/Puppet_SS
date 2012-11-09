class ntp (

) {

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
}