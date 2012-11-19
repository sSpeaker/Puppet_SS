# We can set this parameters from declaration of class, ENC or in hiera.
# If this class was not included via declaration resource 'class' or ENC didn`t set class variables
# Puppet will check every parameters via hiera.
# 
# [module_name_service_name]
#   Custom name of service
#   Default for Debian: ntp
#   Default for RedHat: ntpd
#   Default for other: undef 
#
# [module_name_service_enable]
#   Load service on boot
#   Default: true
#
# [module_name_manage_install]
#   Manage state of package
#   Default: true
#
# [module_name_manage_config]
#   Manage config file
#   Default: true
#
# [module_name_manage_service]
#   Manage state of service
#   Default: true
#
# Sample Usage:
#   class { 'module_name':
#     module_name_service_enable => false,
#     module_name_manage_config => false,
#   }
#
class module_name (
  $module_name_service_name = undef,
  $module_name_service_enable = true,
  $module_name_manage_install = true,
  $module_name_manage_config = true,
  $module_name_manage_service = true,
) {
  # Set service name depend on Operation System
  if ! $module_name_service_name {
    $module_name_service_name_real = $::osfamily ? {
                        'Debian' => hiera('module_name_service_name','ntp'),
                        'RedHat' => hiera('module_name_service_name','ntpd'),
                        default  => hiera('module_name_service_name',undef),
                    }
  } else {
   $module_name_service_name_real = $module_name_service_name
  }
  
  # Define class dependency order to meet the rule: install, configure, start/stop
  Class['module_name::install']-> Class['module_name::config'] -> Class['module_name::service']

  # Install, Configure and Manage service 
  include module_name::install, module_name::config, module_name::service
}