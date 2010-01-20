class PaulRevereGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.migration_template "migration.rb",
                           'db/migrate',
                           :migration_file_name => "create_announcements"
      m.directory 'public/javascripts'
      m.file "announcements.js", "public/javascripts/announcements.js"
    end
  end
end
