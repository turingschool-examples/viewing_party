class CreateGuest < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.references :viewing_party, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
