class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :host, foreign_key: { to_table: :users }
      t.references :movie, foreign_key: true
      t.integer :duration
      t.datetime :date
      t.timestamp :start_time

      t.timestamps
    end
  end
end
