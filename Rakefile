require "bundler/setup"
require "bundler/gem_tasks"
require "appraisal"

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

require "jasmine"
load "jasmine/tasks/jasmine.rake"

task :default do |t|
  if ENV["BUNDLE_GEMFILE"] =~ /gemfiles/
    exec "rake spec jasmine:ci"
  else
    Rake::Task["appraise"].execute
  end
end

task :appraise => ["appraisal:install"] do |t|
  exec "rake appraisal"
end
