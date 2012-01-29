require "neo4j-community/version"


module Neo4j
  module Community

    def self.jars_root
      File.join("#{File.dirname(__FILE__)}", "neo4j-community", "jars")
    end

    def self.test_jars_root
      File.join("#{File.dirname(__FILE__)}", "neo4j-community", "test-jars")
    end

    def self.load_jars!
      require 'java'
      Dir["#{jars_root}/*.jar"].each {|jar| require jar }
    end

    def self.load_test_jars!
      require 'java'
      Dir["#{test_jars_root}/*.jar"].each {|jar| require jar }
    end

    # This can be used by dependent gems to verify the Database versions have no mismatch.
    def self.ensure_version!(other, edition)
      return if ::Neo4j::Community::NEO_VERSION == other
      raise "Mismatch of Neo4j JAR versions. Already loaded neo4j-community JAR files '#{::Neo4j::Community::NEO_VERSION}' but neo4j-#{edition}: '#{other}'." 
    end

  end
end

Neo4j::Community.load_jars!

