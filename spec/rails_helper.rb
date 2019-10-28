# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require "spec_helper"

require "rails"
require "active_record/railtie"

require "dummy/application"

require "rspec/rails"
require "factory_bot"
require "factories"

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Initialize fake app
Dummy::Application.initialize!

# Run migrations
require_relative "../lib/generators/paul_revere/templates/migration"
CreateAnnouncements.suppress_messages { CreateAnnouncements.new.change }

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Rails.application.routes.url_helpers
  config.infer_spec_type_from_file_location!
  config.before(:each) do
    Announcement.delete_all
  end
end
