class module_name::service {
  # If module_name_manage_service = false then do nothing.
  # For better resolving dependencies cycles.
  if str2bool("$module_name::module_name_manage_service") {
	  service { $module_name::module_name_service_name_real:
	    ensure     => $module_name::module_name_service_ensure,
	    enable     => $module_name::module_name_service_enable,
	  }
  }
}
