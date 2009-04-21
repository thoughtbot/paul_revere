require 'test_helper'
require File.join(File.dirname(__FILE__), '..', 'app', 'helpers', 'announcements_helper')
require File.join(File.dirname(__FILE__), '..', 'app', 'models', 'announcement')

class AnnouncementsHelperTest < ActionView::TestCase
  include AnnouncementsHelper

  should "return a new announcement when sent current_announcement and cache doesn't exist" do
    @current_announcement = nil
    Announcement.stubs(:new).returns(:foo)
    assert_equal :foo, current_announcement
  end

  should "return a cached announcement when sent current_announcement and cache exists" do
    @current_announcement = :foo
    Announcement.expects(:new).never
    assert_equal :foo, current_announcement
  end

  context "when there is an announcement" do
    setup do
      Announcement.file_path = "/somewhere/fake"
      @announcement = Announcement.new
      @announcement.stubs(:exists?).returns(true)
      @announcement.stubs(:created_at).returns(Time.now.to_i)
    end

    context "and the user has hidden an announcement" do
      setup { self.stubs(:cookies).returns("announcement_#{@announcement.created_at}" => "hidden") }

      should "return true when sent announcement_hidden? with announcement" do
        assert send(:announcement_hidden?, @announcement)
      end
    end

    context "and the user has not hidden an announcement" do
      setup { self.stubs(:cookies).returns("announcement_#{@announcement.created_at}" => "not hidden") }

      should "return false when sent announcement_hidden? with announcement" do
        assert !send(:announcement_hidden?, @announcement)
      end
    end
  end
end
