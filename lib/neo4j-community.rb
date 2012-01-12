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

    # This can be used by dependent gems to verify the Database versions have no mismatch.
    def self.ensure_version!(other, edition)
      matching = ::Neo4j::Community::NEO_VERSION == other
      return unless matching
      raise "Mismatch of Neo4j JAR versions. Already loaded JAR files #{::Neo4j::Community::NEO_VERSION}, neo4j-#{edition}: #{other}." 
    end

  end
end

Neo4j::Community.load_jars!

