require "bundler/gem_tasks"

def source_file
  gz_file = Dir.new('tmp').entries.find { |x| x =~ /gz$/ }
  File.expand_path("./tmp/#{gz_file}")
end

def unpack_lib_dir
  gz_file = Dir.new('tmp').entries.find { |x| x =~ /gz$/ }
  dir = gz_file.gsub('-unix.tar.gz', '')
  File.expand_path("./tmp/#{dir}/lib")
end

def jar_files_to_copy
  Dir.new(unpack_lib_dir).entries.find_all {|x| x =~ /\.jar/}
end

desc "Delete old Jar files"
task :delete_old_jar do
  root = File.expand_path("./lib/neo4j-community/jars")
  files = Dir.new(root).entries.find_all{|f| f =~ /\.jar/}
  files.each do |file|
    system "rm #{root}/#{file}"
  end
end

desc "Upgrade using downloaded ...tar.gz file in ./tmp"
task :upgrade => [:delete_old_jar] do
  system "cd tmp; tar xf #{source_file}"
  root = File.expand_path("./lib/neo4j-community/jars")
  jar_files_to_copy.each {|f| system "cp #{unpack_lib_dir}/#{f} #{root}"}
end