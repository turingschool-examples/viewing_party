class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :movies, foreign_key: true
      t.integer :duration
      t.datetime :date
      t.string :start_time

      t.timestamps
    end
  end
end
