class ChangePartyMovieDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :parties, :movie, :string 
  end
end
