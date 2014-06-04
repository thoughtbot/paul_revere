require 'spec_helper'

require File.join(File.dirname(__FILE__), '..', '..', 'app', 'models', 'announcement')

describe Announcement do
  it "should return the latest announcement when there are several" do
    old = create_announcement(:body => 'no fun', :created_at => 2.days.ago)
    latest = create_announcement(:body => 'fun', :created_at => 1.day.ago)
    older = create_announcement(:body => 'less fun', :created_at => 3.days.ago)

    expect(Announcement.current).to eq latest
  end

  it "should return an existent announcement where there is no announcement" do
    create_announcement(:body => 'body')
    expect(Announcement.current.exists?).to eq true
  end

  it "should return a non-existent announcement where there is no announcement" do
    expect(Announcement.current.exists?).to be false
  end

  it 'can always assign straight to the body' do
    expect(Announcement.create!(:body => 'hello').body).to eq 'hello'
  end

  def create_announcement(attributes)
    announcement = Announcement.new
    attributes.each do |key, value|
      announcement.send("#{key}=", value)
    end
    announcement.save!
    announcement
  end
end
