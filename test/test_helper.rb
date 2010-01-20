ENV['RAILS_ENV'] = 'test'

require 'rubygems'
require 'shoulda'
require 'action_controller'
require 'action_view'
require 'action_view/test_case'
require 'active_support'
require 'active_support/test_case'
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

