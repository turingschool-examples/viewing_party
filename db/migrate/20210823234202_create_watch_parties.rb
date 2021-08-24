class CreateWatchParties < ActiveRecord::Migration[5.2]
  def change
    create_table :watch_parties do |t|
      t.time :duration
      t.string :movie
      t.string :genre
      t.string :host

      t.timestamps
    end
  end
end
