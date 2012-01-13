module Neo4j
  module Community
    VERSION = "1.6.0.alpha.4"
    NEO_VERSION = "1.6.M02"
  end
end

# Expose the version globally once and here.
NEO_VERSION = Neo4j::Community::NEO_VERSION
