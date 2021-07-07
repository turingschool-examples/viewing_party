class CreateMovieParty < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_parties do |t|
      t.references :user, foreign_key: true
      t.string :movie_title
      t.datetime :date_time
    end
  end
end
