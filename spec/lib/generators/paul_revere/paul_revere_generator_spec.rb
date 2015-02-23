require "rails_helper"
require "generator_spec"
require "generators/paul_revere/paul_revere_generator"

describe PaulRevereGenerator, type: :generator do

  destination File.expand_path("../../tmp", __FILE__)

  before(:all) do
    prepare_destination
    run_generator
  end

  it "installs the migrations" do
    expect(destination_root).to have_structure {
      directory "db" do
        directory "migrate" do
          migration "create_announcements" do
            contains "class CreateAnnouncements"
            contains "create_table :announcements"
          end
        end
      end
    }
  end

  it "installs the javascript" do
    expect(destination_root).to have_structure {
      directory "vendor" do
        directory "assets" do
          directory "javascripts" do
            file "announcements.js" do
              contains "hideAnnouncement"
            end
          end
        end
      end
    }
  end
end
