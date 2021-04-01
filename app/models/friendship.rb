class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  has_many :party_friends, dependent: :destroy
  has_many :parties, through: :party_friends

  validates :friend_id, presence: true

  def self.find_friendships(user_id, friends_ids)
    where(friend_id: friends_ids, user_id: user_id).pluck(:id)
  end

  def self.find_user_friendships(user)
    where(friend_id: user).pluck(:id)
  end
end
