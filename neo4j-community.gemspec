# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "neo4j-community/version"

Gem::Specification.new do |s|
  s.name        = "neo4j-community"
  s.version     = Neo4j::Community::VERSION
  s.authors     = ["Dmytrii Nagirniak", "Andreas Ronge"]
  s.email       = ["dnagir@gmail.com", "andreas.ronge@gmail.com"]
  s.homepage    = "https://github.com/dnagir/neo4j-community"
  s.summary     = "The neo4j Community edition v#{Neo4j::Community::NEO_VERSION} JAR files"
  s.description = "The Java Jar files for the Neo4j Community, a high performance, fully ACID transactional graph database – licensed under the GPL, see license - http://neo4j.org/licensing-guide/ "

  s.rubyforge_project = "neo4j-community"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

#  s.platform      = 'java'

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "jeweler"
  # s.add_runtime_dependency "rest-client"
end
