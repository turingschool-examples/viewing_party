class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :friendships
  has_many :friends, class_name: :User, through: :friendships

  has_secure_password
end
