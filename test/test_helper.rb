ENV['RAILS_ENV'] = 'test'

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
RAILS_ROOT = PROJECT_ROOT

require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'shoulda'
require 'action_controller'
require 'action_view'
require 'action_view/test_case'
require 'active_record'
require 'test_help'
require 'redgreen'

class ActionView::TestCase
  class TestController < ActionController::Base
    attr_accessor :request, :response, :params

    def initialize
      @request = ActionController::TestRequest.new
      @response = ActionController::TestResponse.new

      # TestCase doesn't have context of a current url so cheat a bit
      @params = {}
      send(:initialize_current_url)
    end
  end
end

class ActiveSupport::TestCase
  setup do
    Announcement.delete_all
  end
end

database_file = File.join(File.dirname(__FILE__), 'test.db')
at_exit { FileUtils.rm(database_file) }

load File.join(PROJECT_ROOT, 'generators', 'paul_revere', 'templates', 'migration.rb')
ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => database_file
)
CreateAnnouncements.suppress_messages { CreateAnnouncements.migrate(:up) }
