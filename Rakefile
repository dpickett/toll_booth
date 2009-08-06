require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "toll_booth"
    gem.summary = %Q{API Wrapper for Google Directions}
    gem.description = %Q{API Wrapper for Google Directions}
    gem.email = "dpickett@enlightsolutions.com"
    gem.homepage = "http://github.com/dpickett/toll_booth"
    gem.authors = ["Dan Pickett"]
    gem.add_dependency("jnunemaker-httparty", ">= 0.4.4")  
    gem.add_dependency("hpoydar-chronic_duration", ">= 0.7.4")
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

namespace :rcov do
  require 'rcov/rcovtask'
  Rcov::RcovTask.new(:tests) do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.rcov_opts = %w{--aggregate coverage.data --exclude osx\/objc,gems\/,spec\/}
    test.verbose = true
  end  
  
  require 'cucumber/rake/task'  
  Cucumber::Rake::Task.new(:cucumber) do |t|    
    t.rcov = true
    t.rcov_opts = %w{--aggregate coverage.data --exclude osx\/objc,gems\/,features\/,spec\/ -o "features_rcov"}
  end
end

begin
  require 'rcov/rcovtask'
  desc "Run both specs and features to generate aggregated coverage"
  task :rcov do |t|
    rm "coverage.data" if File.exist?("coverage.data")
    Rake::Task["rcov:cucumber"].invoke
    Rake::Task["rcov:tests"].invoke
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features)
rescue LoadError
  task :features do
    abort "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
  end
end

begin
  require 'reek/rake_task'
  Reek::RakeTask.new do |t|
    t.fail_on_error = true
    t.verbose = false
    t.source_files = 'lib/**/*.rb'
  end
rescue LoadError
  task :reek do
    abort "Reek is not available. In order to run reek, you must: sudo gem install reek"
  end
end

begin
  require 'roodi'
  require 'roodi_task'
  RoodiTask.new do |t|
    t.verbose = false
  end
rescue LoadError
  task :roodi do
    abort "Roodi is not available. In order to run roodi, you must: sudo gem install roodi"
  end
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "toll_booth #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

