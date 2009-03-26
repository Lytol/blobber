require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "blobber"
    gem.summary = %Q{An ORM-like abstraction layer for CRUDing objects to any db supporting the memcached protocol (memcachedb, Tokyo Tyrant, etc)}
    gem.email = "bsmith@swig505.com"
    gem.homepage = "http://github.com/Lytol/blobber"
    gem.authors = ["Brian Smith"]
    gem.add_dependency('json', '>= 1.1.3')
    gem.add_dependency('uuidtools', '>= 1.0.7')
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'blobber'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/unit/*_test.rb','test/integration/*_test.rb']
  test.verbose = false
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

desc "Run performance benchmarks"
task :benchmark do
  Dir['test/benchmark/*.rb'].each { |f| load f }
end


task :default => :test
