class CreateViewingParty < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.references :host, foreign_key: {to_table: :users}
      t.integer :duration
      t.date :date
      t.time :start_time

      t.timestamps
    end
  end
end
