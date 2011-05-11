require 'rails/generators/active_record/migration'

class PaulRevereGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  extend ActiveRecord::Generators::Migration

  desc "Put the javascript and migration in place"
  source_root File.join(File.dirname(__FILE__), "templates")

  def install
    copy_file "announcements.js", "public/javascripts/announcements.js"
    migration_template "migration.rb", "db/migrate/create_announcements.rb"
  end
end
