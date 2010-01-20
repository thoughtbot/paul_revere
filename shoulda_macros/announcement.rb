class ActiveSupport::TestCase

  def self.with_current_announcement(&blk)
    context "When there is a current announcement" do
      setup do
        Annoucement.create!(:body => 'therefore,')
      end
      merge_block(&blk)
    end
  end

  def self.should_display_current_announcement
    should "have the current announcement in it" do
      assert_match Announcement.current.body, @email.body
    end 
  end

end
