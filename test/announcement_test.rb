require 'test_helper'
require File.join(File.dirname(__FILE__), '..', 'app', 'models', 'announcement')

class AnnouncementTest < ActiveSupport::TestCase
  
  context "with a fake file_path" do
    setup { Announcement.file_path = "/something/fake" }

    context "An Announcment when there is an announcement" do
      setup do
        File.expects(:readable?).with(Announcement.file_path).returns true
        file = mock
        file.expects(:read).returns("Announcement Body")
        @mtime = Time.now
        file.expects(:mtime).returns @mtime
        File.expects(:open).with(Announcement.file_path).returns file
        @announcement = Announcement.new
      end

      should "return modification time went sent created_at" do
        assert_equal @mtime.to_i, @announcement.created_at
      end
      
      should "return announcement body when sent body" do
        assert_equal "Announcement Body", @announcement.body
      end
      
      should "return true when sent exists?" do
        assert @announcement.exists?
      end
    end
    
    context "An announcement when there is a blank announcement" do
      setup do
        File.expects(:readable?).with(Announcement.file_path).returns true
        file = mock
        file.expects(:read).returns("")
        File.expects(:open).with(Announcement.file_path).returns file
        @announcement = Announcement.new
      end
      
      should "return nil when sent created_at" do
        assert @announcement.created_at.nil?
      end
      
      should "return have a blank body" do
        assert @announcement.body.blank?
      end
      
      should "return false when sent exists?" do
        assert !@announcement.exists?
      end
    end

    context "An announcement when there is no announcement file" do
      setup do
        File.expects(:readable?).with(Announcement.file_path).returns false
        @announcement = Announcement.new
      end
      
      should "return nil when sent created_at" do
        assert @announcement.created_at.nil?
      end
      
      should "return have a blank body" do
        assert @announcement.body.blank?
      end

      should "return false when sent exists?" do
        assert !@announcement.exists?
      end
    end
  end

end
