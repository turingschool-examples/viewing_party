class RenamePartyColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :parties, :movie_api_id, :movie_id 
    rename_column :parties, :start_time_day, :start_time
  end
end
