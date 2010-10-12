ENV['RAILS_ENV'] = 'test'

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

require 'rubygems'
require 'rails/all'
require 'shoulda'
require 'bourne'
require 'redgreen'

module PaulRevere
  class Application < Rails::Application
  end
end

class ActiveSupport::TestCase
  setup do
    Announcement.delete_all
  end
end

load File.join(PROJECT_ROOT, 'generators', 'paul_revere', 'templates', 'migration.rb')
ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => ':memory:'
)
CreateAnnouncements.suppress_messages { CreateAnnouncements.migrate(:up) }
