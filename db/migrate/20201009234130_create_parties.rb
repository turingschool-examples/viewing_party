class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :movie_title
      t.integer :api_id
      t.integer :duration
      t.date :date_of_party
      t.time :start_time
      t.references :user
      t.timestamps
    end
  end
end
