require "rails_helper"

describe "announcements/_public_announcement" do
  it "renders nothing when announcements are not visible" do
    allow(view).to receive(:announcement_visible?).and_return(false)
    render

    expect(rendered).to eq ""
  end

  it "renders the announcement when announcements are visible" do
    announcement = create :announcement, body: "Test"
    allow(view).to receive(:announcement_visible?).and_return(true)
    render

    expect(rendered).to match /Test/
    expect(rendered).to match /#{announcement.to_cookie_key}/
    expect(rendered).to match /hideAnnouncement/
  end
end
