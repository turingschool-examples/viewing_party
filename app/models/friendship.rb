class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def self.create_mutual_friendship(current_user_id, friend_id)
    friendships = [{ user_id: current_user_id, friend_id: friend_id },
                   { user_id: friend_id, friend_id: current_user_id }]
    Friendship.create!(friendships)
  end
end
