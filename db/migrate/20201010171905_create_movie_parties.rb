class CreateMovieParties < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_parties do |t|
      t.string :movie_title
      t.integer :duration
      t.string :date
      t.string :start_time

      t.timestamps
    end
  end
end
