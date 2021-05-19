class AddMovieApiIdToParty < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :movie_api_id, :string
  end
end
