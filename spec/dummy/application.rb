# Used by specs
module ApplicationHelper
  def current_user; raise; end
end

# Used by specs
class User; end

# Minimal Rails application for specs
module Dummy
  class Application < Rails::Application
    config.secret_key_base = "test"
    config.paths["config/database"] = ["spec/support/database.yml"]
    config.cache_classes = true
    config.eager_load = false

    if config.active_record.sqlite3.respond_to?(:represent_boolean_as_integer)
      if Rails.gem_version < Gem::Version.new("6.0")
        config.active_record.sqlite3.represent_boolean_as_integer = true
      end
    end
  end
end
