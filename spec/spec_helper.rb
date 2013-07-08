# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require "rails/all"
require "rspec/rails"

# Pull in the fake rails app
require 'fake_app'
require 'mocha/setup'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Remove this line if you don't want RSpec's should and should_not
  # methods or matchers
  require 'rspec/expectations'
  config.include RSpec::Matchers

  # == Mock Framework
  config.mock_framework = :mocha

  # Remove announcements before each example
  config.before(:each) do
    Announcement.delete_all
  end
end
