class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.date :date
      t.time :time
      t.integer :duration

      t.timestamps
    end
  end
end
