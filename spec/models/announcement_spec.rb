require "rails_helper"

describe Announcement, "#current" do
  it "should return the latest announcement when there are several" do
    old = create :announcement, body: "no fun", created_at: 2.days.ago
    latest = create :announcement, body: "fun", created_at: 1.day.ago
    older = create :announcement, body: "less fun", created_at: 3.days.ago

    expect(Announcement.current).to eq latest
  end

  it "should return an existent announcement where there is no announcement" do
    create :announcement, body: "body"
    expect(Announcement.current.exists?).to be true
  end

  it "should return a non-existent announcement where there is no announcement" do
    expect(Announcement.current.exists?).to be false
  end
end

describe Announcement, "#to_cookie_key" do
  it "returns a value usable as a cookie key" do
    record = create :announcement, body: 'Text'

    expect(record.to_cookie_key).to eq "announcement_#{record.created_at.iso8601}"
  end
end
