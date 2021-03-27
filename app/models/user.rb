class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, on: :create, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

  has_many  :followed_users,
            foreign_key: :follower_id,
            class_name: 'Friend',
            dependent: :destroy
  has_many  :followed, through: :followed_users, inverse_of: :followers
  has_many  :following_users,
            foreign_key: :followed_id,
            class_name: 'Friend',
            dependent: :destroy
  has_many  :followers, through: :following_users, inverse_of: :followed
end
