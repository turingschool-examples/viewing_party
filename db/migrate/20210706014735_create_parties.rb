class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :movie_api_id
      t.float :duration
      t.datetime :start_time_day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
