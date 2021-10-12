class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  has_secure_password
  has_many :attendees
  has_many :events
  has_many :events, through: :attendees
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Friendship', dependent: :destroy
  has_many :followees, through: :followed_users
  has_many :following_users,foreign_key: :followee_id, class_name: 'Friendship', dependent: :destroy
  has_many :followers, through: :following_users
end
