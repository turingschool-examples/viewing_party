class AddForeignKeysToFriends < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :friends, :users, column: :sender_id
    add_foreign_key :friends, :users, column: :receiver_id
  end
end
