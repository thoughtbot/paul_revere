class CreateAnnouncements < ActiveRecord::Migration
  def self.up
    create_table :announcements do |t|
      t.text :body
      t.timestamps :null => false
    end
  end

  def self.down
    drop_table :announcements
  end
end
