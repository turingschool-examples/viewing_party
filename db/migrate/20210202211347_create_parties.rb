class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :User, foreign_key: true
      t.references :Movie, foreign_key: true
      t.date :scheduled_date
      t.time :start_time
      t.integer :duration

      t.timestamps
    end
  end
end
