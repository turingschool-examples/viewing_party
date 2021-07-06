class User < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true

  has_secure_password

  has_many :friendships
  has_many :friends, through: :friendships
end