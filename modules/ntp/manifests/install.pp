class ntp::install {
  if $ntp::install {
	  package { $ntp::package:
	    ensure => $ntp::$package_ensure,
	  }
  }
}
