class CreateUserFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :user_friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.timestamps
    end
  end
end
