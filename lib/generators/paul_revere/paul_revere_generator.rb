require 'rails/generators/active_record/migration'

class PaulRevereGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  extend ActiveRecord::Generators::Migration

  desc "Put the JavaScript and migration in place"
  source_root File.join(File.dirname(__FILE__), "templates")

  def install
    copy_javascript
    migration_template "migration.rb", "db/migrate/create_announcements.rb"
  end

  private

  def copy_javascript
    if needs_js_copied?
      copy_file File.join(javascript_path, 'announcements.js'), 'public/javascripts/announcements.js'
    end
  end

  def javascript_path
    File.join(%w(.. .. .. .. app assets javascripts))
  end

  def needs_js_copied?
    ::Rails.version < '3.1' || !::Rails.application.config.assets.enabled
  end
end
