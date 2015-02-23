require "rails_helper"

describe AnnouncementsHelper, "#current_announcement" do
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
end

describe AnnouncementsHelper, "#announcement_hidden?" do
  before do
    @announcement = Announcement.create!(body: "a body")
    assign :announcement, @announcement
  end

  describe "and the user has hidden an announcement" do
    it "returns true when sent announcement_hidden? with announcement" do
      allow(helper).to receive(:cookies).and_return("announcement_#{@announcement.created_at}" => "hidden")

      expect(helper.announcement_hidden?(@announcement)).to be true
    end
  end

  describe "and the user has not hidden an announcement" do
    it "returns false when sent announcement_hidden? with announcement" do
      allow(helper).to receive(:cookies).and_return("announcement_#{@announcement.created_at}" => "not hidden")

      expect(helper.announcement_hidden?(@announcement)).to be false
    end
  end
end

class User; end
module ApplicationHelper; def current_user; raise; end; end

describe AnnouncementsHelper, "#announcement_visibility_allowed?" do
  it "returns true with a user present" do
    allow(helper).to receive(:current_user).and_return(User.new)

    expect(helper.announcement_visibility_allowed?).to eq true
  end

  it "returns false without a user present" do
    allow(helper).to receive(:current_user).and_return(nil)

    expect(helper.announcement_visibility_allowed?).to eq false
  end
end

describe AnnouncementsHelper, "#announcement_visible?" do
  describe "with an announcement that exists" do
    let(:announcement) { Announcement.create!(body: 'Test') }
    it "returns true when the announcement is not hidden" do
      allow(helper).to receive(:announcement_hidden?).and_return(false)
      result = helper.announcement_visible?(announcement)

      expect(result).to eq true
    end
    it "returns false when the announcement is hidden" do
      allow(helper).to receive(:announcement_hidden?).and_return(true)
      result = helper.announcement_visible?(announcement)

      expect(result).to eq false
    end
  end

  describe "with an announcement that does not exist" do
    let(:announcement) { Announcement.new }
    it "returns false when the announcement is hidden" do
      allow(helper).to receive(:announcement_hidden?).and_return(true)
      result = helper.announcement_visible?(announcement)

      expect(result).to eq false
    end

    it "returns false when the announcement is not hidden" do
      allow(helper).to receive(:announcement_hidden?).and_return(false)
      result = helper.announcement_visible?(announcement)

      expect(result).to eq false
    end
  end
end
