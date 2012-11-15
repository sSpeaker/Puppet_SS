MODULE STRUCTURE:

my_module — This outermost directory’s name matches the name of the module. 
 • manifests/ — Contains all of the manifests in the module. 
  o init.pp — Contains a class definition. This class’s name must match the module’s name.
  o install.pp — Contains a class named my_module::install.
  o service.pp — Contains a class named my_module::service.
  o config.pp — Contains a class named my_module::config.
 • files/ — Contains static files, which managed nodes can download.
 • lib/ — Contains plugins, like custom facts and custom resource types.
 • templates/ — Contains templates, which can be referenced from the module’s manifests.

1)  Init.pp contains a parameterized class named my_class where we describe all the module’s defaults. Defaults can be overridden through ENC.
Inside this class we operate with variables depending on the different facts, like OS or another variables.

Also we must describe ordering and include all the classes at the end of our parameterized class.

      Class['my_class::install']-> Class['my_class::config'] -> Class['my_class::service']
      include my_class::install, my_class::config, my_class::service

2)  Install.pp contains package resource that installs needed software depending on the variables described in init.pp 

3)  Config.pp contains resources to create and manage directories/files (like modes, owner and groups, contents etc.). All parameters are described in init.pp

4)  Service.pp contains a class that manages states of required service depending on the variables described in init.pp.

Each of the classes can be turned off/on using variables in init.pp like: 
$my_class::my_class_manage_service = true

All the code must be checked by puppet-lint

External links:
Style guide - http://docs.puppetlabs.com/guides/style_guide.html
Documentation - http://docs.puppetlabs.com/
