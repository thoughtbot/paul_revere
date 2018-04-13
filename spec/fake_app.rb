# Classes required for the tests
class User; end
module ApplicationHelper; def current_user; raise; end; end

# Create a rails app
module PaulRevere
  class Application < Rails::Application
    config.secret_key_base = "test"
    config.paths["config/database"] = ["spec/support/database.yml"]
    config.eager_load = false
    if Rails.gem_version >= Gem::Version.new("5.2")
      config.active_record.sqlite3.represent_boolean_as_integer = true
    end
  end
end
PaulRevere::Application.initialize!

# Run migrations
require_relative "../lib/generators/paul_revere/templates/migration"
CreateAnnouncements.suppress_messages { CreateAnnouncements.new.change }
