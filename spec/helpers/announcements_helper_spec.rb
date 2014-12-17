require 'rails_helper'

require File.join(File.dirname(__FILE__), '..', '..', 'app', 'helpers', 'announcements_helper')
require File.join(File.dirname(__FILE__), '..', '..', 'app', 'models', 'announcement')

describe AnnouncementsHelper do

  it "should return the current announcement when sent current_announcement and cache doesn't exist" do
    assign :current_announcement, nil
    allow(Announcement).to receive(:current).and_return(:foo)
    expect(helper.current_announcement).to eq :foo
  end

  it "should return a cached announcement when sent current_announcement and cache exists" do
    assign :current_announcement, :foo
    expect(Announcement).not_to receive(:current)
    expect(helper.current_announcement).to eq :foo
  end

  describe "when there is an announcement" do
    before do
      @announcement = Announcement.create!(:body => 'a body')
      assign :announcement, @announcement
    end

    describe "and the user has hidden an announcement" do
      before do
        allow(helper).to receive(:cookies).and_return("announcement_#{@announcement.created_at}" => "hidden")
      end

      it "should return true when sent announcement_hidden? with announcement" do
        expect(helper.announcement_hidden?(@announcement)).to be true
      end
    end

    describe "and the user has not hidden an announcement" do
      before do
        allow(helper).to receive(:cookies).and_return("announcement_#{@announcement.created_at}" => "not hidden")
      end

      it "should return false when sent announcement_hidden? with announcement" do
        expect(helper.announcement_hidden?(@announcement)).to be false
      end
    end
  end
end
