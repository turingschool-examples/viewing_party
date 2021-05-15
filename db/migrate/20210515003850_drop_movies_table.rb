class DropMoviesTable < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :parties, :movies
    drop_table :movies
  end
end
