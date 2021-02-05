class UpdateFriendships < ActiveRecord::Migration[5.2]
  def change
    change_column :friendships, :status, :integer, default: 'pending'
  end
end
