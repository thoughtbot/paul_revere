require 'rails/generators/active_record'

class PaulRevereGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  desc "Copy the PaulRevere JavaScript and announcements migration"
  source_root File.join(File.dirname(__FILE__), "templates")

  def install
    copy_javascript
    migration_template "migration.rb", "db/migrate/create_announcements.rb"
  end

  private

  def copy_javascript
    copy_file File.join(javascript_path, "announcements.js"), javascript_destination
  end

  def javascript_path
    File.join(%w(.. .. .. .. app assets javascripts))
  end

  def javascript_destination
    "vendor/assets/javascripts/announcements.js"
  end

  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end
end
