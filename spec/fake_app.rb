# Create a rails app
module PaulRevere
  class Application < Rails::Application
    config.secret_key_base = "test"
    config.paths["config/database"] = ["spec/support/database.yml"]
    config.eager_load = false
  end
end
PaulRevere::Application.initialize!

# Run migrations
require_relative "../lib/generators/paul_revere/templates/migration"
CreateAnnouncements.suppress_messages { CreateAnnouncements.new.change }
