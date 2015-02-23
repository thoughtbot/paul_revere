require "rails_helper"

describe "announcements/_announcement_for_all" do
  it "renders nothing when announcement does not exist" do
    expect(Announcement.count).to eq 0
    render

    expect(rendered).to eq ""
  end

  it "renders nothing when an Announcement exists but is hidden" do
    Announcement.create!(body: "Test")
    allow(view).to receive(:announcement_hidden?).and_return(true)
    render

    expect(rendered).to eq ""
  end

  it "renders the announcement when an Announcement exists and is not hidden" do
    announcement = Announcement.create!(body: "Test")
    render

    expect(rendered).to match /Test/
    expect(rendered).to match /announcement_#{announcement.created_at.iso8601}/
  end
end
