class ntp::service {
  if $ntp::ntp_use_service {
	  service { $ntp::ntp_service_name_real:
	    ensure     => $ntp::ntp_service_ensure,
	    enable     => $ntp::ntp_service_enable,
	  }
  }
}
