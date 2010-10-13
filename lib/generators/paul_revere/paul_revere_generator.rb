class PaulRevereGenerator < Rails::Generator::Base
  desc "Put the javascript and migration in place"
  source_root File.join(File.dirname(__FILE__), "templates")

  def install
    directory "public/javascripts"
    file "announcements.js", "public/javascripts/announcements.js"
    migration_template "migration.rb", "db/migrate/create_announcements.rb"
  end
end
