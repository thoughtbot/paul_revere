# Create a rails app
module PaulRevere
  class Application < Rails::Application
    config.secret_key_base = '39085eb8b8aebd18942baec9e6ba0519310089b9a0212c7525'
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
end if Rails.version < "4.0.0"

CreateAnnouncements.suppress_messages { CreateAnnouncements.up }
