class ntp::config {
  
  file { $ntp::config_file:
    ensure  => $ntp::ensure,
    owner   => $ntp::config_file_owner,
    group   => $ntp::config_file_group,
    mode    => $ntp::config_file_mode,
    content => template('ntp/ntp.conf.erb'),
    }
  
  if $ntp::use_service {
    File [$ntp::config_file] {
      notify  => Class['ntp::service'],
    }
  }
  
  if $ntp::use_install {
    File [$ntp::config_file] {
      require => Class['ntp::install'],
    }
  }
}


