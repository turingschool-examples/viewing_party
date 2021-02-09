class AddColumnsToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :movie_title, :string
    add_column :parties, :movie_id, :bigint
    add_column :parties, :movie_length, :integer
  end
end
