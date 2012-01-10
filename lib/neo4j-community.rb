require "neo4j-community/version"


module Neo4j
  module Community

    def self.jars_root
      "#{File.dirname(__FILE__)}/neo4j-community/jars"
    end

    def self.load_jars!
      require 'java'
      Dir["#{jars_root}/*.jar"].each {|jar| require jar }
    end

  end
end

Neo4j::Community.load_jars!

