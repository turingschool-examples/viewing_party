class CreateGuestList < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_lists do |t|
      t.references :party, foreign_key: true
      t.references :friend, references: :users, foreign_key: { to_table: :users }
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
