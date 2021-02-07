class RemoveFriendshipId < ActiveRecord::Migration[5.2]
  def change
    remove_column :party_guests, :friendship_id
    add_reference :party_guests, :user, index: true
  end
end
