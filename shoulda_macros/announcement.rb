class ActiveSupport::TestCase

  def self.with_current_announcement(&blk)
    context "When there is a current announcement" do
      setup do
        File.stubs(:readable?).with(Announcement.file_path).returns true
        file = mock
        file.stubs(:read).returns("Announcement Body")
        @mtime = Time.now
        file.stubs(:mtime).returns @mtime
        File.stubs(:open).with(Announcement.file_path).returns file
      end
      merge_block(&blk)
    end
  end

  def self.should_display_current_announcement
    should "have the current announcement in it" do
      assert_match Announcement.new.body, @email.body
    end 
  end

end
