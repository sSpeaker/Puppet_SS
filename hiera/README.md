### Custom backend for hiera.

Written for using Puppet dashboard with parameterized classes. Return valley of global variable.

How to use:
  1. Put it to "/usr/lib/ruby/site_ruby/1.8/hiera/backend/";
  2. Add to /etc/puppet/hiera.yaml "puppet_var" backend.
  3. Use the same variable name in puppet dashboard and parameterized class.
    Example:
>    class test ( test_var_name="local" ) {
>    ...
>    }
    If we wrote "test_var_name=glabal" in dashboard (set global var test_var_name) puppet will take this value. If we didn`t set this var puppet will take default.