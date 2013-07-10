require 'rake'
require 'bundler/gem_tasks'

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = Songkickr::VERSION ? Songkickr::VERSION : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "songkickr #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
