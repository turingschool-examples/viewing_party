class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.references :users, foreign_key: true
      t.references :events, foreign_key: true

      t.timestamps
    end
  end
end
