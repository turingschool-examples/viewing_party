class FixFriendshipsColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :friendships, :user_id, :friend_id
  end
end
