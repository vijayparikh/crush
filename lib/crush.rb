require 'rubygems'
require 'securerandom'
require 'fileutils'
require 'json'

module Crush

  VERSION='0.0.0'

  class Implementation
    def add(json_payload) 
    	id = SecureRandom.uuid
    	FileUtils.mkdir_p(record_location(id))
    	location = File.join(record_location(id), id+'.json')
    	File.open(location,"w") do |f|
    	  f.write(JSON.pretty_generate(JSON.parse(json_payload)))
    	  id
  	  end
    end

    def get(document_id)
    	location = File.join(record_location(document_id), document_id+'.json')
    	File.read(location) if File.exists?(location)
    end

    def count  
      Dir[File.join(db_directory, '**', '*')].count { |file| File.file?(file) }
    end
   
    def delete(document_id)
      location = File.join(record_location(document_id), document_id+'.json')
      File.delete(location) if File.exists?(location)
      # *** OPTIMIZE *** this traveses all directories, iregardless of the record we just deleted.
      clean_db
    end

    def drop
    	FileUtils.rm_r db_directory if File.exists?(db_directory)
    end

    def version
    	spec = Gem::Specification::load("crush.gemspec")
    	spec.version
    end

    private

    def db_directory
      if ENV['CRUSH_DATA_DIR'].nil?
      	File.join(Dir.pwd, "crush.data") 
      else
      	ENV['CRUSH_DATA_DIR']
      end
    end

    def record_location(id)	
      components = [db_directory] + id.split('-')
      record_location = File.join(components)
    end  

    def clean_db 
      Dir[File.join(db_directory,'**/*')].select { |d| File.directory? d } \
        .sort \
        .reverse \
        .each {|d| Dir.rmdir(d) if Dir.entries(d).size ==  2}
    end
  end
end