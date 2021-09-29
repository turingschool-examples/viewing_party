class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :attendees, through: :events

  # has_many :followed_users, foreign_key: :follower_id, class_name: 'Friendship', dependent: :destroy
  # has_many :followees, through: :followed_users
  #
  # has_many following_users,foreign_key: :followee_id, class_name: 'Friendship', dependent: :destroy
  # has_many :followers, through: :following_users

  validates :email, uniqueness: true, presence: true

end
