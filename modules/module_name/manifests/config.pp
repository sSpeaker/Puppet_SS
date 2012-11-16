class module_name::config {
  # If module_name_manage_config = false then do nothing.
  # For better resolving dependencies cycles.
    if str2bool("$module_name::module_name_manage_config") {
	  file { $module_name::module_name_config_file:
			ensure  => $module_name::module_name_ensure,
			owner   => $module_name::module_name_config_file_owner,
			group   => $module_name::module_name_config_file_group,
			mode    => $module_name::module_name_config_file_mode,
			content => template('module_name/module_name.conf.erb'),
			notify  => Class['module_name::service'],
	  }
  }
}
