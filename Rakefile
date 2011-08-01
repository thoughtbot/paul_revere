require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require "rubygems/package_task"
require 'appraisal'

desc "Default: run the unit tests."
task :default => [:all]

desc 'Test the plugin under all supported Rails versions.'
task :all => ["appraisal:install"] do |t|
  exec('rake appraisal test')
end

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the paul revere plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the paul revere plugin.'
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'PaulRevere'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

spec = Gem::Specification.new do |s|
  s.name              = "paul_revere"
  s.version           = "0.1.5"
  s.summary           = "Simple announcement plugin to include 'one off' style announcements in Rails web apps."
  s.author            = "Thoughtbot"
  s.email             = "support@thoughtbot.com"
  s.homepage          = "https://github.com/thoughtbot/paul_revere"
  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README.textile)
  s.rdoc_options      = %w(--main README.textile)
  s.files             = %w(init.rb MIT-LICENSE Rakefile README.textile) +
                        Dir.glob("{test,lib/**/*,app/**/*}")
  s.require_paths     = ["lib"]

  s.add_dependency("rails", "~> 3.0.0")
  s.add_development_dependency("bourne")
  s.add_development_dependency("shoulda")
  s.add_development_dependency("redgreen")
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

task :package => :gemspec
