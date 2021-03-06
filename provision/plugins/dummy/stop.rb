module Dummy
  class Stop < Vagrant.plugin("2", :command)
    def execute
      options = {}

      opts = OptionParser.new do |o|
        o.banner = "Usage: vagrant dummy stop [-h]"
        o.separator ""
      end

      # Parse the options
      argv = parse_options(opts)
      return if !argv
      raise Vagrant::Errors::CLIInvalidUsage, :help => opts.help.chomp if argv.length > 0

      `vagrant ssh -c "sudo service apache2 stop" web01`

      # Success, exit status 0
      0
    end
  end
end
