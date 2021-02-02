class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :user, foreign_key: true => "sender_id"
      t.references :user, foreign_key: true => "receiver_id"
      t.integer :request_status

      t.timestamps
    end
  end
end
