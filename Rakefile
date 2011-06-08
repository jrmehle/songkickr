require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "songkickr"
    gem.summary = %Q{A Ruby wrapper around the Songkick API.}
    gem.description = %Q{A Ruby wrapper around the Songkick API. Visit www.songkick.com/developer for documentation on the Songkick API. }
    gem.email = "jrmehle@gmail.com"
    gem.homepage = "http://github.com/jrmehle/songkickr"
    gem.authors = ["Jared Mehle"]
    gem.add_development_dependency "shoulda", ">= 2.11.0"
    gem.add_development_dependency "fakeweb", ">= 1.3.0"
    gem.add_development_dependency "redgreen", ">= 1.2.2"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "songkickr #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
