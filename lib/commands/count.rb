require 'crush'
require 'cmdparse'

module Command
  class Count < CmdParse::Command
    def initialize
      super('count', takes_commands: false)
      short_desc('Total number of json documents in the database')
    end

  	def execute()
  	  crush = Crush::Implementation.new
  	  STDOUT.puts crush.count
  	end
  end
end
