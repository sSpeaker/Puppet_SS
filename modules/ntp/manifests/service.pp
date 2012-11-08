class ntp::service {
  if ntp::use_service {
	  service { $ntp::service_name:
	    ensure     => $ntp::service_ensure,
	    enable     => $ntp::service_enable,
	  }
	  
	  if $ntp::use_config {
	    Service ["$ntp::service_name"]{
	      require => Class['ntp::config']
	    }
	  }
	  
	  if $ntp::use_install {
	     Service ["$ntp::service_name"]{
	      require => Class['ntp::install']
	    }
	  }
  }
}
