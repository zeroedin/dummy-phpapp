module Dummy
  class Start < Vagrant.plugin("2", :command)
    def execute
      options = {}

      opts = OptionParser.new do |o|
        o.banner = "Usage: vagrant dummy start [-h]"
        o.separator ""
      end

      # Parse the options
      argv = parse_options(opts)
      return if !argv
      raise Vagrant::Errors::CLIInvalidUsage, :help => opts.help.chomp if argv.length > 0

      @env.cli 'up'
      @env.ui.info "Dummy App is ready at http://dummy.lvh.me:8888."

      # Success, exit status 0
      0
    end
  end
end
