class ntp::service {

<<<<<<< HEAD
  service { $ntp::service_name:
    ensure     => $ntp::service_ensure,
    enable     => $ntp::service_enable,
=======
  service { $service_name:
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasstatus  => $service_hasstatus,
    hasrestart => $service_hasrestart,
>>>>>>> branch 'master' of https://github.com/sSpeaker/Puppet_SS.git
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
