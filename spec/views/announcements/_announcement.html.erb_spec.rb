require "rails_helper"

class User; end

module ApplicationHelper
  def current_user
    raise
  end
end

describe "announcements/_announcement" do
  before(:example) do
    stub_template "announcements/_announcement_for_all.html.erb" => "Partial"
  end

  it "renders the all partial when there is a user" do
    allow(view).to receive(:current_user).and_return(User.new)
    render

    expect(rendered).to match /Partial/
  end

  it "does not render the all partial when there is not a user" do
    allow(view).to receive(:current_user).and_return(nil)
    render

    expect(rendered).to eq "\n"
  end
end
