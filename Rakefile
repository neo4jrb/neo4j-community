require "bundler/gem_tasks"

def tar_file
  Dir.new('tmp').entries.find { |x| x =~ /gz$/ || x =~ /tar$/}
end

def source_file
  File.expand_path("./tmp/#{tar_file}")
end

def unpack_lib_dir
  file = tar_file
  dir = file.gsub('-unix.tar.gz', '')
  dir = dir.gsub('-unix.tar', '')
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
    puts "Delete #{file}"
    system "git rm #{root}/#{file}"
  end
end

desc "Upgrade using downloaded ...tar.gz file in ./tmp"
task :upgrade => [:delete_old_jar] do
  system "cd tmp; tar xf #{source_file}"
  jars = File.expand_path("./lib/neo4j-community/jars")
  puts "Jar dir #{jars}"
  FileUtils.mkdir_p(jars)
  test_jars = File.expand_path("./lib/neo4j-community/test-jars")
  jar_files_to_copy.each {|f| system "cp #{unpack_lib_dir}/#{f} #{jars}; git add #{jars}/#{f}" unless f =~ /tests/}
  jar_files_to_copy.each {|f| system "cp #{unpack_lib_dir}/#{f} #{test_jars}" if f =~ /tests/}
end