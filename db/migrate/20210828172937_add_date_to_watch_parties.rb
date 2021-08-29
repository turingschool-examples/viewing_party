class AddDateToWatchParties < ActiveRecord::Migration[5.2]
  def change
    add_column :watch_parties, :date, :datetime
    add_column :watch_parties, :start_time, :time
    add_column :watch_parties, :movie_id, :string
    add_reference :watch_parties, :user, foreign_key: true
  end
end
