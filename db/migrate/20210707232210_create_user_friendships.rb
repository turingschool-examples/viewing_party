class CreateUserFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :user_friendships do |t|
      t.references :user, foreign_key: true
      t.references :friend, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
