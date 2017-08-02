require 'crush'
require 'cmdparse'

module Command
  class Drop < CmdParse::Command
    def initialize
      super('drop', takes_commands: false)
      short_desc('Drops the database')
      options.on('-f', '--force', "Don't ask") { data[:force] = true }
    end

  	def execute
  	  crush = Crush::Implementation.new
      unless data[:force] 
        STDOUT.print "Drop database '#{crush.send(:db_directory)}'?  [Y/n]: "
        response = STDIN.gets.chomp
        case response
        when 'Y'
          crush.drop
        end
      else
        crush.drop
      end
  	end
  end
end
