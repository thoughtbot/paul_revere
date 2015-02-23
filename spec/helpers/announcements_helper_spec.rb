require "rails_helper"

describe AnnouncementsHelper do

  it "returns the current announcement when sent current_announcement and there is nothing in cache" do
    assign :current_announcement, nil
    allow(Announcement).to receive(:current).and_return(:foo)
    expect(helper.current_announcement).to eq :foo
  end

  it "returns a cached announcement when sent current_announcement and cache exists" do
    assign :current_announcement, :foo
    expect(Announcement).not_to receive(:current)
    expect(helper.current_announcement).to eq :foo
  end

  describe "when there is an announcement" do
    before do
      @announcement = Announcement.create!(body: "a body")
      assign :announcement, @announcement
    end

    describe "and the user has hidden an announcement" do
      before do
        allow(helper).to receive(:cookies).and_return("announcement_#{@announcement.created_at}" => "hidden")
      end

      it "returns true when sent announcement_hidden? with announcement" do
        expect(helper.announcement_hidden?(@announcement)).to be true
      end
    end

    describe "and the user has not hidden an announcement" do
      before do
        allow(helper).to receive(:cookies).and_return("announcement_#{@announcement.created_at}" => "not hidden")
      end

      it "returns false when sent announcement_hidden? with announcement" do
        expect(helper.announcement_hidden?(@announcement)).to be false
      end
    end
  end
end
