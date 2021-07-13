class AddRuntimeToMovieParties < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_parties, :runtime, :integer
  end
end
