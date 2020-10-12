class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :movie_title
      t.integer :api_id
      t.integer :duration
      t.datetime :datetime_of_party
      t.references :user
      t.timestamps
    end
  end
end
