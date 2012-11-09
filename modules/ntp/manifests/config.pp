class ntp::config {
  if $ntp::use_config {
	  file { $ntp::config_file:
			ensure  => $ntp::ensure,
			owner   => $ntp::config_file_owner,
			group   => $ntp::config_file_group,
			mode    => $ntp::config_file_mode,
			content => template('ntp/ntp.conf.erb'),
#			notify  => Class['ntp::service'],
	  }
  }
}
