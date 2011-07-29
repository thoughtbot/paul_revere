ENV['RAILS_ENV'] = 'test'

require 'rubygems'
require 'rails/all'
require 'shoulda'
require 'shoulda/rails'
require 'bourne'

begin require 'redgreen'; rescue LoadError; end

module PaulRevere
  class Application < Rails::Application
  end
end

class ActiveSupport::TestCase
  setup do
    Announcement.delete_all
  end
end

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
require File.join(PROJECT_ROOT, 'lib', 'generators', 'paul_revere', 'templates', 'migration')
ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => ':memory:'
)
CreateAnnouncements.suppress_messages { CreateAnnouncements.migrate(:up) }
