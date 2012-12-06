class Hiera
  module Backend
    class Puppet_var_backend
      def initialize
        Hiera.debug("Hiera puppet_var backend starting")
      end
      def lookup(key, scope, order_override, resolution_type)
        answer = nil

        Hiera.debug("Looking up #{key} in puppet_var backend")

        Backend.datasources(scope, order_override) do |source|
          Hiera.debug("Looking for data source #{source}")
          answer = scope["::#{key}"]
        end
        return answer
      end
    end
  end
end