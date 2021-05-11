class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.date :date_of_party
      t.time :time_of_party
      t.integer :length
      t.references :movie, null: false, foreign_key: true
      t.references :host, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
