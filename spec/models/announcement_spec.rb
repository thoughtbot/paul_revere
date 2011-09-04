require 'spec_helper'

require File.join(File.dirname(__FILE__), '..', '..', 'app', 'models', 'announcement')

describe Announcement do
  it "should return the latest announcement when there are several" do
    old = Announcement.create!(:body => 'no fun', :created_at => 2.days.ago)
    latest = Announcement.create!(:body => 'fun', :created_at => 1.day.ago)
    older = Announcement.create!(:body => 'less fun', :created_at => 3.days.ago)

    Announcement.current.should == latest
  end

  it "should return an existent announcement where there is no announcement" do
    Announcement.create!(:body => 'body')
    Announcement.current.exists?.should == true
  end

  it "should return a non-existent announcement where there is no announcement" do
    Announcement.current.exists?.should be_false
  end
end
