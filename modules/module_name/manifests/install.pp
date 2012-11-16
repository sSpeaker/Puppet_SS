class module_name::install {
  # If module_name_manage_install = false then do nothing.
  # For better resolving dependencies cycles.
  if str2bool("$module_name::module_name_manage_install") {
	  package { $module_name::module_name_package:
	    ensure => $module_name::module_name_package_ensure,
	  }
  }
}
