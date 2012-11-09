class ntp::install {
  if $ntp::use_install {
	  package { $ntp::package:
	    ensure => $ntp::package_ensure,
	  }
  }
}
