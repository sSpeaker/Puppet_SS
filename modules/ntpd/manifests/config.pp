class ntpd::config ($ntpd_config_file,
                    $ntpd_config_file_state){
  file {$ntpd_config_file:
    ensure => $ntpd_config_file_state,
    source => template(file.cfg.erb)
  }
}