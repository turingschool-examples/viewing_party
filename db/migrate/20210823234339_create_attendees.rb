class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.references :watch_party, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
