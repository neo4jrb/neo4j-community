require "bundler/gem_tasks"

def download_folder
  abort "Please create a #{File.expand_path('tmp')} folder and copy the neo4j community gz/tar file downloaded from http://neo4j.org/download" unless File.directory?('tmp')
  Dir.new('tmp')
end

def tar_file
  download_folder.entries.find { |x| x =~ /gz$/ || x =~ /tar$/}.tap do |f|
    abort "expected a neo4j .gz/.tar file in folder #{File.expand_path(download_folder.path)}"  unless f
  end
end

def source_file
  File.expand_path("./tmp/#{tar_file}")
end

def unpack_lib_dir
  dir = tar_file.gsub('-unix.tar.gz', '')
  dir = dir.gsub('-unix.tar', '')
  File.expand_path("./tmp/#{dir}/lib")
end

def jar_files_to_copy
  Dir.new(unpack_lib_dir).entries.find_all {|x| x =~ /\.jar/ && x !~ /neo4j-shell(.*)jar/ && x !~ /jline(.*)jar/ }
end

def system_unpack_lib_dir
  dir = tar_file.gsub('-unix.tar.gz', '')
  dir = dir.gsub('-unix.tar', '')
  File.expand_path("./tmp/#{dir}/system/lib")
end

def system_jars
  Dir.new(system_unpack_lib_dir).entries.find_all {|x| x =~ /concurrentlinkedhashmap-lru/}
end

desc "List System Jars"
task :list do
  puts system_jars.inspect
end


desc "Download Neo4j Distro"
task :download, :version  do |_, params|
  version = params[:version]
  # download_site = "http://www.neo4j.org/download_thanks?edition=community&release=#{version}&platform=unix&packaging=zip&architecture=x32"
  download_site = "http://neo4j.com/artifact.php?name=neo4j-community-#{version}-unix.tar.gz"

#  system "open #{download_site}"
  filename = "neo4j-community-#{version}-unix.tar.gz"
  system "mv ~/Downloads/#{filename} ./tmp"
end

desc "Delete old Jar files"
task :delete_old_jar do
  root = File.expand_path("./lib/neo4j-community/jars")
  files = Dir.new(root).entries.find_all{|f| f =~ /\.jar/}
  files.each do |file|
    system "git rm #{root}/#{file}"
  end
end

def version
  @version ||= tar_file.match(/\d.\d.([^-]*)/)[0]
end

def download_test_jar
  file = "neo4j-kernel-#{version}-tests.jar"
  #puts "DOWNLOAD TEST JAR #{file} from http://repo.typesafe.com"
  # neo4j-kernel-2.1.0-M01-tests.jar
  remote_file = "http://search.maven.org/remotecontent?filepath=org/neo4j/neo4j-kernel/#{version}/#{file}"

  puts "Download #{remote_file} to #{unpack_lib_dir}"
  system "wget #{remote_file} -O #{file}"
  # system "wget http://repo.typesafe.com/typesafe/repo/org/neo4j/neo4j-kernel/#{version}/#{file}"
  system "mv #{file} #{unpack_lib_dir}"
end

desc "Upgrade using downloaded ...tar.gz file in ./tmp"
task :upgrade => [:delete_old_jar, :prod_jars]

task :prod_jars do
  system "cd tmp; tar xf #{source_file}"
  jars = File.expand_path("./lib/neo4j-community/jars")
  FileUtils.mkdir_p(jars)
  test_jars = File.expand_path("./lib/neo4j-community/test-jars")

  download_test_jar

  test_jar_files_to_copy, non_test_jar_files_to_copy = jar_files_to_copy.partition {|f| f =~ /tests/ }

  non_test_jar_files_to_copy.each do |f|
    system "cp #{unpack_lib_dir}/#{f} #{jars}"
    system "git add #{jars}/#{f}"
  end
  system_jars.each do |f|
    unless f =~ /tests/
      system "cp #{system_unpack_lib_dir}/#{f} #{jars}" 
      system "git add #{jars}/#{f}" 
    end
  end

  system "mkdir -p #{test_jars}"

  puts 'test_jar_files_to_copy', test_jar_files_to_copy.inspect
  test_jar_files_to_copy.each do |f|
    system "cp #{unpack_lib_dir}/#{f} #{test_jars}"
    system "git add #{test_jars}/#{f}"
  end
end
