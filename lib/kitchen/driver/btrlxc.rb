require 'kitchen/driver/btrlxc_version'
require 'kitchen/driver/ssh_base'

module Kitchen
  module Driver
    class Btrlxc < Kitchen::Driver::SSHBase
      plugin_version Kitchen::Driver::BTRLXC_VERSION

      no_parallel_for :create
      # Creates an instance.
      def create(state)
      end

      # Destroys an instance.
      def destroy(state)
      end
    end
  end
end
