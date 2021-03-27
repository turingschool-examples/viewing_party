class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.datetime :date
      t.integer :duration
      t.string :movie_title
      t.references :movies, foreign_key: true
      t.timestamps
    end
  end
end
