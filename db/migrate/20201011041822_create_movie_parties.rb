class CreateMovieParties < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_parties do |t|
      t.string :movie_title
      t.integer :duration
      t.string :date
      t.integer :start_time
      t.belongs_to :user, foreign_key: true
      t.belongs_to :friend
    end
  end
end
