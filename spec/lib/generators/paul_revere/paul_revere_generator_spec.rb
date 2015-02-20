require "rails_helper"
require "generator_spec"
require "generators/paul_revere/paul_revere_generator"

describe PaulRevereGenerator, type: :generator do

  destination File.expand_path("../../tmp", __FILE__)
  arguments %w(something)

  before(:all) do
    prepare_destination
    run_generator
  end

  specify do
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

end
