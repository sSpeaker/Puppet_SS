class ntp::install {
  if str2bool($ntp::ntp_manage_install) {
	  package { $ntp::ntp_package:
	    ensure => $ntp::ntp_package_ensure,
	  }
  }
}
