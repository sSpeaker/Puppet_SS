class ntpd::config {
  file {$ntpd_config_file:
    ensure => $ntpd_config_file_state,
    source => template(file.cfg.erb)
  }
}