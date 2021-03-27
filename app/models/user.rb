class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, on: :create, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Friend'
  has_many :followed, through: :followed_users
  has_many :following_users, foreign_key: :followed_id, class_name: 'Friend'
  has_many :followers, through: :following_users
end
