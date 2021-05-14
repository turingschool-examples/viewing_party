class User < ApplicationRecord
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Friend'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Friend'
  has_many :followers, through: :following_users


  validates :email, uniqueness: true, presence: true
  validates :username, presence: true
  validates :password, presence: { require: true }
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  has_secure_password

end
