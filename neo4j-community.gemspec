# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "neo4j-community/version"

Gem::Specification.new do |s|
  s.name        = "neo4j-community"
  s.version     = Neo4j::Community::VERSION
  s.authors     = ["Dmytrii Nagirniak"]
  s.email       = ["dnagir@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{The JAR Files downloaded from neo4j.org}
  s.description = %q{The JAR Files downloaded form neo4j.org, check the license}

  s.rubyforge_project = "neo4j-community"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
