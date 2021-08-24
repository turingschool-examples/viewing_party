class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.references :party, foreign_key: {to_table: :viewing_parties}
      t.references :guest, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
