class ntp::install {
  if $ntp::ntp_manage_install {
	  package { $ntp::ntp_package:
	    ensure => $ntp::ntp_package_ensure,
	  }
  }
}
