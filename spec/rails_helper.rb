# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require "spec_helper"

require "rails/all"
require "rspec/rails"

require "fake_app"

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

require "factory_bot"
require "factories"

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Rails.application.routes.url_helpers
  config.infer_spec_type_from_file_location!
  config.before(:each) do
    Announcement.delete_all
  end
end
