class User < ApplicationRecord
  has_secure_password

  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, confirmation: { case_sensitive: true }

  has_many :user_viewing_parties
  has_many :parties, through: :user_viewing_parties
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Friendship'
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: 'Friendship'
  has_many :followers, through: :following_users
end
