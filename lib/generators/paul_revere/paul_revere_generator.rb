require 'rails/generators/active_record'

class PaulRevereGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  desc "Put the JavaScript and migration in place"
  source_root File.join(File.dirname(__FILE__), "templates")

  def install
    copy_javascript if needs_js_copied?
    migration_template "migration.rb", "db/migrate/create_announcements.rb"
    migration "announcement.rb", "app/models/announcement.rb"
  end

  def add_attr_accessible
    inject_into_class "app/models/announcement.rb", Announcement, "attr_accessible :body\n\n" if Rails.version < "4.0.0"
  end

  def self.next_migration_number(directory)
    ActiveRecord::Generators::Base.next_migration_number(directory)
  end

  private

  def copy_javascript
    copy_file File.join(javascript_path, 'announcements.js'), js_destination
  end

  def javascript_path
    File.join(%w(.. .. .. .. app assets javascripts))
  end

  def needs_js_copied?
    ::Rails.version < '3.1' || !::Rails.application.config.assets.enabled || ::Rails.version >= "4.0.0"
  end

  def js_destination
    'public/javascripts/announcements.js'
  end
end
