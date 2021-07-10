class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_many :user_friendships, dependent: :destroy
  has_many :friends, through: :user_friendships

  has_secure_password
end
