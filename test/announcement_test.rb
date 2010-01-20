require 'test_helper'
require File.join(File.dirname(__FILE__), '..', 'app', 'models', 'announcement')

class AnnouncementTest < ActiveSupport::TestCase
  should "return the latest announcement when there are several" do
    old = Announcement.create!(:body => 'no fun', :created_at => 2.days.ago)
    latest = Announcement.create!(:body => 'fun', :created_at => 1.day.ago)
    older = Announcement.create!(:body => 'less fun', :created_at => 3.days.ago)

    assert_equal latest, Announcement.current
  end

  should "return an existent announcement where there is no announcement" do
    Announcement.create!(:body => 'body')
    assert Announcement.current.exists?
  end

  should "return a non-existent announcement where there is no announcement" do
    assert ! Announcement.current.exists?
  end
end
