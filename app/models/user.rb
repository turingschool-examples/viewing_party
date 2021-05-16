class User < ApplicationRecord
  has_secure_password

  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, confirmation: { case_sensitive: true }

  has_many :user_parties
  has_many :parties, through: :user_parties

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
end
