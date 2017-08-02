require 'crush'
require 'cmdparse'
require 'json'

module Command
  class Get < CmdParse::Command
    def initialize
      super('get', takes_commands: false)
      short_desc('Retrieves a json document by document id')
    end

  	def execute(document_id)
  	  crush = Crush::Implementation.new
      STDOUT.puts crush.get(document_id)
  	  #STDOUT.puts JSON.pretty_generate(crush.get(document_id))
  	end
  end
end
