class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.text :body
      t.timestamps null: false
    end
  end
end
