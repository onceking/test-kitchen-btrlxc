require 'kitchen/driver/btrlxc_version'
require 'kitchen/driver/ssh_base'
require 'mixlib/shellout'

module Kitchen
  module Driver
    class Btrlxc < Kitchen::Driver::SSHBase
      plugin_version Kitchen::Driver::BTRLXC_VERSION

      default_config :btrlxc_rb, '/usr/local/share/gems/bin/btrlxc.rb'

      no_parallel_for :create
      def create(state)
        name = [instance.name, SecureRandom.hex(4)].join('-')
        _run!("sudo #{config[:btrlxc_rb]} create #{instance.platform.name} #{name}")
        state[:lxc_name] = name
        state[:hostname] = _run!("sudo #{config[:btrlxc_rb]} get-ip #{name}").strip
      end

      # Destroys an instance.
      def destroy(state)
        if state[:lxc_name]
          _run!("sudo #{config[:btrlxc_rb]} destroy #{state[:lxc_name]}")
        end
      end

      private

      def _run!(cmd)
        sh = Mixlib::ShellOut.new(cmd, live_stream: $stdout)
        sh.run_command
        sh.error!
        sh.stdout
      end
    end
  end
end
