class CreateViewings < ActiveRecord::Migration[5.2]
  def change
    create_table :viewings do |t|
      t.references :movie, foreign_key: true
      t.integer :duration
      t.date :date
      t.time :start_time

      t.timestamps
    end
  end
end
