class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :movie_parties, dependent: :destroy
end
