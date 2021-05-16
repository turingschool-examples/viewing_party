class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :movie_title
      t.integer :viewing_party_duration
      t.timestamp :viewing_party_date
      t.timestamp :start_time
      t.integer :host_id

      t.timestamps
    end
  end
end
