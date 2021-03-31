class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  has_many :party_friends
  has_many :parties, through: :party_friends

  validates :friend_id, presence: true

  def self.find_friendships(user, friends_ids)
    where(friend_id: friends_ids, user_id: user).pluck(:id)
  end
end
