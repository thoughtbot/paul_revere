# Create a rails app
module PaulRevere
  class Application < Rails::Application
  end
end

# Run migrations
project_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
require File.join project_root, 'lib', 'generators', 'paul_revere', 'templates', 'migration'

ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => ":memory:"
)

ActiveSupport.on_load(:active_record) do
  attr_accessible(nil)
end

CreateAnnouncements.suppress_messages { CreateAnnouncements.up }
