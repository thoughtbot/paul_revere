# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{paul_revere}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thoughtbot"]
  s.date = %q{2010-10-12}
  s.email = %q{support@thoughtbot.com}
  s.extra_rdoc_files = ["README.textile"]
  s.files = ["init.rb", "install.rb", "MIT-LICENSE", "Rakefile", "README.textile", "uninstall.rb", "lib/paul_revere.rb"]
  s.homepage = %q{http://thoughtbot.com/community}
  s.rdoc_options = ["--main", "README.textile"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Simple announcement plugin to include 'one off' style announcements in Rails web apps.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.0"])
      s.add_development_dependency(%q<bourne>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<redgreen>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0.0"])
      s.add_dependency(%q<bourne>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<redgreen>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0.0"])
    s.add_dependency(%q<bourne>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<redgreen>, [">= 0"])
  end
end
