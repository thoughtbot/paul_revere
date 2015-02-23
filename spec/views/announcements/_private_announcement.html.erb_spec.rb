require "rails_helper"

describe "announcements/_private_announcement" do
  before(:example) do
    stub_template "announcements/_public_announcement.html.erb" => "Partial"
  end

  it "renders the all partial when allowed to view announcements" do
    allow(view).to receive(:announcement_visibility_allowed?).and_return(true)
    render

    expect(rendered).to match /Partial/
  end

  it "does not render the all partial when not allowed to view announcements" do
    allow(view).to receive(:announcement_visibility_allowed?).and_return(false)
    render

    expect(rendered).to eq ""
  end
end
