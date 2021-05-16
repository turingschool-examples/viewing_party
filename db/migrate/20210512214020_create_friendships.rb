class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true, index: false
      t.references :friend, null: false, foreign_key: { to_table: :users }, index: false
      t.index %i[user_id friend_id], unique: true

      t.timestamps
    end
  end
end
