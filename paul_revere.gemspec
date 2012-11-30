$:.push File.expand_path("../lib", __FILE__)
require "paul_revere/version"

Gem::Specification.new do |s|
  s.name        = "paul_revere"
  s.version     = PaulRevere::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Nick Quaranto', 'Matt Jankowski', 'Joe Ferris', 'Christopher Meiklejohn', 'Tammer Saleh', 'Jason Morrison', 'Gabe Berke-Williams']
  s.email       = "support@thoughtbot.com"
  s.homepage    = "https://github.com/thoughtbot/paul_revere"
  s.summary     = "Simple announcement plugin to include 'one off' style announcements in Rails web apps."
  s.description = "Paul Revere provides a model and helper methods to do one-off style announcements."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("rails", "~> 3.0")

  s.add_development_dependency("rspec")
  s.add_development_dependency("rspec-rails")
  s.add_development_dependency("sqlite3")
  s.add_development_dependency("mocha", "0.12.3")
  s.add_development_dependency("appraisal")
end
