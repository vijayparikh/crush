require 'crush'
require 'cmdparse'

module Command
  class Delete < CmdParse::Command
    def initialize
      super('delete', takes_commands: false)
      short_desc('Deletes a json document by document id')
    end

  	def execute(document_id)
  	  crush = Crush::Implementation.new
  	  crush.delete(dcoument_id)  
  	end
  end
end
