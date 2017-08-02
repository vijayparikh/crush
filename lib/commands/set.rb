require 'crush'
require 'cmdparse'

module Command
  class Set < CmdParse::Command
    def initialize
      super('set', takes_commands: false)
      short_desc('Writes a json document and returns the document id')
    end

  	def execute(json)
  	  crush = Crush::Implementation.new
  	  STDOUT.puts crush.add(json)  
  	end
  end
end
