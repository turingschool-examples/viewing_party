class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :movie_db_id
      t.string :title
      t.integer :runtime

      t.timestamps
    end
  end
end
