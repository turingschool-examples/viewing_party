class CreatePartyGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :party_guests do |t|
      t.references :view_party, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
