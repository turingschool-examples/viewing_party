class CreateFriend < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :friender_id, foreign_key: true
      t.integer :friendee_id, foreign_key: true

      t.timestamps
    end
  end
end
