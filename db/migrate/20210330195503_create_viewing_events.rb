class CreateViewingEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_events do |t|
      t.integer :duration
      t.time :start_date_time
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
