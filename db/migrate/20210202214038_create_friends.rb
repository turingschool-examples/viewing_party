class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :request_status_integer

      t.timestamps
    end
  end
end
