module Neo4j

  module Community
    VERSION = "1.6.0.alpha.3"
    NEO_VERSION = "1.6.M02"
  end

  # make sure community, advanced and enterprise neo4j jar files have the same version
  if defined?(NEO_VERSION)
    if NEO_VERSION != Community::NEO_VERSION
      raise "Mismatch of Neo4j JAR versions. Already loaded JAR files #{NEO_VERSION}, neo4j-community: #{Community::NEO_VERSION}" 
    end
  else
    NEO_VERSION = Community::NEO_VERSION
  end
end
