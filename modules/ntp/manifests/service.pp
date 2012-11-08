class ntp::service {
  if ntp::use_service {
	  service { $ntp::service_name:
	    ensure     => $ntp::service_ensure,
	    enable     => $ntp::service_enable,
	  }
  }
}
