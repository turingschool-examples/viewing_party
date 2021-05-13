class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :movie_id, :bigint
    remove_column :parties, :user_id, :bigint
    remove_column :users, :status, :integer
    add_column :parties, :api_movie_id, :integer
  end
end
