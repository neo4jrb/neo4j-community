JAR files for the neo4j Graph Database
==================================================

This gem provides a set of jar files of the Neo4j Graph Database.

To use it: `require 'neo4j-jars'`

It can be used directly but the intention is to use it with [neo4j.rb](https://github.com/andreasronge/neo4j).

Versioning
==================================================

The major and minor versions of the gem correspond to the version of the database.
The patch version is different.

That means:

- if you need `1.6`, use `~> 1.6.0` in the Gemfile. It will always update to the latest version of 1.6 of the database.
- if you need `1.6.M02`, then you will need to find the appropriate gem version on the [RubyGems](http://rubygems.org) and lock it (using `= 1.6.25` for example). But it will always be `1.6.xxx`.

License
==================================================

This gem is MIT licensed.

However the jars included are licensed by [Neo4j](http://neo4j.orb).

