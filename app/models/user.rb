class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  has_many :friendships, dependent: :restrict_with_exception
  has_many :friends, through: :friendships
  has_many :parties, dependent: :destroy
  has_many :guests, through: :parties

  def add_friend(new_friend)
    friends << new_friend
    new_friend.friends << self
  end
end
