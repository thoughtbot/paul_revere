require 'spec_helper'

require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'generators', 'paul_revere', 'templates', 'announcement')

describe Announcement do
  before(:each) do
    Announcement.class_eval do
      attr_accessible :body
    end
  end if Rails.version < "4.0.0"

  it "should return the latest announcement when there are several" do
    old = create_announcement(:body => 'no fun', :created_at => 2.days.ago)
    latest = create_announcement(:body => 'fun', :created_at => 1.day.ago)
    older = create_announcement(:body => 'less fun', :created_at => 3.days.ago)

    Announcement.current.should == latest
  end

  it "should return an existent announcement where there is no announcement" do
    create_announcement(:body => 'body')
    Announcement.current.exists?.should == true
  end

  it "should return a non-existent announcement where there is no announcement" do
    Announcement.current.exists?.should be_false
  end

  it 'can always assign straight to the body' do
    Announcement.create!(:body => 'hello').body.should == 'hello'
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
