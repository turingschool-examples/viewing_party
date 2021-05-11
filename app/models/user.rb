class User < ApplicationRecord
  has_many :user_friends
  has_many :friends, through: :user_friends

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
