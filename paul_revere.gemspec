Gem::Specification.new do |s|
  s.name = "paul_revere"
  s.version = "0.1.6"
  s.date = %q{2011-09-04}
  s.email = "support@thoughtbot.com"
  s.homepage = "https://github.com/thoughtbot/paul_revere"
  s.summary = "Simple announcement plugin to include 'one off' style announcements in Rails web apps."
  s.description = "Paul Revere provides a model and helper methods to do one-off style announcements."
  s.files = Dir["{app,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.md", "init.rb"]
  s.authors = ['Nick Quaranto', 'Matt Jankowski', 'Joe Ferris', 'Christopher Meiklejohn', 'Tammer Saleh', 'Jason Morrison', 'Gabe Berke-Williams']
  s.add_dependency("rails", "~> 3.0")
  s.add_development_dependency("rspec")
  s.add_development_dependency("sqlite3")
  s.add_development_dependency("mocha")
end
