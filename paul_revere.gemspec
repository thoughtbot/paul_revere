$:.push File.expand_path("../lib", __FILE__)
require "paul_revere/version"

Gem::Specification.new do |s|
  s.name        = "paul_revere"
  s.version     = PaulRevere::VERSION.dup
  s.licenses    = ["MIT"]
  s.platform    = Gem::Platform::RUBY
  s.authors     = [
    'Matt Jankowski',
    'Nick Quaranto',
    'Mike Burns',
    'Joe Ferris',
    'Christopher Meiklejohn',
    'Tammer Saleh',
    'Gabe Berke-Williams',
    'Adarsh Pandit',
    'Cameron Desautels',
    'Jason Morrison',
    'Dan Croak',
    'Ben Orenstein',
    'Prem Sichanugrist',
    'Amrit Ayalur',
  ]
  s.email       = "support@thoughtbot.com"
  s.homepage    = "https://github.com/thoughtbot/paul_revere"
  s.summary     = "Simple announcement plugin to include `one off` style announcements in Rails web apps."
  s.description = "Paul Revere provides a model and helper methods to do one-off style announcements."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("rails", ">= 5.0", "< 6.1")

  s.add_development_dependency("appraisal", "~> 2.1")
  s.add_development_dependency("factory_bot_rails", "~> 4.8")
  s.add_development_dependency("generator_spec", "~> 0.9")
  s.add_development_dependency("jasmine", "~> 3.1")
  s.add_development_dependency("rspec-rails", "~> 3.7")
  s.add_development_dependency("sqlite3", "~> 1.3")
end
